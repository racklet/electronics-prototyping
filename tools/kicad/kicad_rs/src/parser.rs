use kicad_parse_gen::schematic as kicad_schematic;
use std::collections::HashMap;
use std::path::Path;

use crate::error::{errorf, DynamicResult};
use crate::types::*;

// SchematicTree keeps track of all kicad_parse_gen
// Schematics in a hierarchical schematic configuration
#[derive(Debug)]
pub struct SchematicTree {
    schematic: kicad_schematic::Schematic,
    sub_schematics: HashMap<String, SchematicTree>,
}

impl SchematicTree {
    // Load a hierarchical SchematicTree from the given base schematic path
    pub fn load(path: &Path) -> DynamicResult<Self> {
        let mut sub_schematics = HashMap::new();
        let schematic = kicad_schematic::parse_file(path)?;
        for sub_sheet in schematic.sheets.iter() {
            let filename = kicad_schematic::filename_for_sheet(&schematic, sub_sheet)?;
            sub_schematics.insert(sub_sheet.name.clone(), SchematicTree::load(&filename)?);
        }

        Ok(Self {
            schematic,
            sub_schematics,
        })
    }

    // Parse the SchematicTree into our own nested Schematic struct
    pub fn parse(&self) -> DynamicResult<Schematic> {
        parse_schematic(self, String::new())
    }

    // Update the components in the kicad_parse_gen Schematic tree using the given
    // nested Schematic struct (copy values from Attributes to ComponentFields)
    pub fn update(&mut self, schematic: &Schematic) -> DynamicResult<()> {
        // Update the fields of all components in this schematic
        for component in schematic.components.iter() {
            self.schematic
                .modify_component(&component.labels.reference, |c| {
                    for attribute in component.attributes.iter() {
                        let name = attribute.name.as_str().or_default("Value");
                        c.update_field(name, &attribute.value.to_string());
                        c.update_field(
                            &format!("{}{}", name, "_expr"),
                            // TODO: Fix the escaping issue in upstream kicad_parse_gen
                            //  and remove this field update altogether.
                            &escape(&attribute.expression),
                        );
                    }
                })
        }

        // Recursively update sub-schematics
        for sub_schematic in schematic.sub_schematics.iter() {
            match self.sub_schematics.get_mut(&sub_schematic.id) {
                None => {
                    return Err(errorf(&format!(
                        "unknown sub-schematic: {}",
                        sub_schematic.id
                    )))
                }
                Some(sub_tree) => sub_tree.update(sub_schematic)?,
            };
        }

        Ok(())
    }

    // Write all Schematics in the SchematicTree hierarchy to their
    // respective files, starting from the node this is called for
    pub fn write(&self) -> DynamicResult<()> {
        let path = self.schematic.filename.as_ref().ok_or(errorf(&format!(
            "missing path for schematic {}",
            self.schematic.description.title
        )))?;
        kicad_parse_gen::write_file(Path::new(path), &self.schematic.to_string())?;
        for sub_schematic in self.sub_schematics.values() {
            sub_schematic.write()?;
        }
        Ok(())
    }
}

/// Turns the given KiCad schematic into a recursive Schematic struct
fn parse_schematic(file: &SchematicTree, id: String) -> DynamicResult<Schematic> {
    // Parse the fields for the schematic
    let meta = parse_meta(&file.schematic)?;
    let globals = parse_globals(&file.schematic)?;
    let components = parse_components(&file.schematic)?;
    let sub_schematics = parse_sub_schematics(&file)?;

    // Construct and return the parsed schematic
    Ok(Schematic {
        id,
        meta,
        globals,
        components,
        sub_schematics,
    })
}

/// Parses the metadata from the given KiCad schematic
fn parse_meta(kicad_sch: &kicad_schematic::Schematic) -> DynamicResult<SchematicMeta> {
    // Only include non-empty comments
    let comments = vec![
        kicad_sch.description.comment1.as_str(),
        kicad_sch.description.comment2.as_str(),
        kicad_sch.description.comment3.as_str(),
        kicad_sch.description.comment4.as_str(),
    ]
    .iter()
    .flat_map(|c| c.filter_empty())
    .collect();

    let filename = if let Some(f) = &kicad_sch.filename {
        Some(f.to_string_lossy().to_string())
    } else {
        None
    };

    Ok(SchematicMeta {
        filename,
        title: kicad_sch.description.title.as_str().filter_empty(),
        date: kicad_sch.description.date.as_str().filter_empty(),
        revision: kicad_sch.description.rev.as_str().filter_empty(),
        company: kicad_sch.description.comp.as_str().filter_empty(),
        comments,
    })
}

/// Parses global definitions from text notes in the KiCad schematic
fn parse_globals(kicad_sch: &kicad_schematic::Schematic) -> DynamicResult<Vec<Attribute>> {
    let mut globals = Vec::new();

    // Loop through the elements of the schematic, which includes text notes as well
    for el in &kicad_sch.elements {
        // Only match Text elements that have type Note
        let text_element = match el {
            kicad_schematic::Element::Text(t) => match t.t {
                kicad_schematic::TextType::Note => t,
                _ => continue,
            },
            _ => continue,
        };

        // TODO: Require a special marked in the text for this parser to parse it.
        // The text element contains literal "\n" elements
        for line in text_element.text.split("\\n") {
            // Format: Foo[.Bar.Baz..] = <expr> [; <unit>]

            // First, split by the equals sign. If the equals sign does not exist,
            // just continue.
            let (attr_name, expr) = match line.split_once("=") {
                None => continue,
                Some(a) => a,
            };

            // Then, split the "remaining" part expr into two parts by ";", where
            // the first part overwrites expr, and the other part optionally becomes unit
            let (expr, unit) = match expr.split_once(";") {
                None => (expr, None),
                Some(a) => (a.0, Some(a.1)),
            };

            // Trim whitespace for all variables
            let (attr_name, expr) = (attr_name.trim(), expr.trim());

            // attr_name and expr must be non-empty
            if attr_name.is_empty() || expr.is_empty() {
                continue;
            }

            // Push the new attribute into the given vector
            globals.push(Attribute {
                name: attr_name.into(),
                value: String::new().into(), // TODO: How do we resolve this value?
                expression: expr.into(),
                unit: unit.map(|u| u.trim().into()),
                comment: None,
            })
        }
    }

    Ok(globals)
}

/// Parses the component definitions present in the given KiCad schematic
fn parse_components(kicad_sch: &kicad_schematic::Schematic) -> DynamicResult<Vec<Component>> {
    let mut components = Vec::new();

    // Walk through all components in the sheet
    for comp in kicad_sch.components() {
        // Require comp.name to be non-empty
        if comp.name.is_empty() {
            return Err(errorf("Every component must have a name"));
        }

        let footprint_str = get_component_attr(&comp, "Footprint");
        let symbol_str = comp.name.as_str();

        // Fill in the metadata about the component. Reference and package fields are validated to be non-empty
        // later, once we know if the component should be included in the result.
        let mut c = Component {
            labels: ComponentLabels {
                reference: comp.reference.clone(),
                footprint_library: footprint_str.split_char_n(':', 0).or_empty_str(),
                footprint_name: footprint_str.split_char_n(':', 1).or_empty_str(),
                symbol_library: symbol_str.split_char_n(':', 0).or_empty_str(),
                symbol_name: symbol_str.split_char_n(':', 1).or_empty_str(),
                model: get_component_attr(&comp, "Model"),
                datasheet: get_component_attr(&comp, "UserDocLink"),
                extra: HashMap::new(),
            },
            classes: vec![],
            attributes: vec![],
        };

        // m maps the lower-case representation to the whatever-cased representation
        let mut m = HashMap::new();
        // Walk through all the fields, and fill in the m map
        for f in &comp.fields {
            // Optimistically try to insert key_lower into m, and error if there was a duplicate
            let key_lower = f.name.to_lowercase();
            match m.insert(key_lower, f.name.clone()) {
                None => (), // Key didn't exist before, all ok
                Some(oldval) => {
                    return Err(errorf(&format!(
                        "duplicate keys: {} and {}",
                        oldval, f.name
                    )));
                }
            }
        }

        // Walk through the attributes, and look for one that ends with _expr or _expression
        for f in &comp.fields {
            let fname = f.name.to_lowercase();
            // Strip the expr suffixes from the lower-cased fname, or skip it if the suffix isn't correct
            let main_key = if fname.ends_with("_expr") {
                fname.trim_end_matches("_expr")
            } else if fname.ends_with("_expression") {
                fname.trim_end_matches("_expression")
            } else {
                continue;
            };

            // The unit & comment values can be found from the main key + the "_unit"/"_comment" suffixes
            let unit_key = main_key.to_string() + "_unit";
            let comment_key = main_key.to_string() + "_comment";

            // Create a new attribute with the given parameters
            c.attributes.push(Attribute {
                // Special case: if the main key is "value", it is the default attribute, and hence name can be ""
                name: if main_key == "value" {
                    String::new()
                } else {
                    m.get(main_key)
                        .map(|s| s.as_str())
                        .unwrap_or(main_key) // TODO: Instead of defaulting to main_key, fallback to f.name - the expr suffix
                        .into()
                },
                // Get the main key value. It is ok if it's empty, too.
                value: Value::parse(get_component_attr_mapped(&comp, main_key, &m).or_empty_str()),
                // As this field corresponds to the main key expression attribute, we can get the
                // expression directly. kicad_parse_gen escapes/unescapes strings with quotes
                // incorrectly though, so we need a workaround.
                // TODO: Fix the escaping issue in upstream
                //  kicad_parse_gen and remove this workaround.
                expression: unescape(&f.value),
                // Optionally, get the unit and a comment
                unit: get_component_attr_mapped(&comp, &unit_key, &m),
                comment: get_component_attr_mapped(&comp, &comment_key, &m),
            });
        }

        // Only register to the list if it has any expressions, or if it has iccc_show = true set
        if c.attributes.len() > 0
            || get_component_attr_mapped(&comp, "iccc_show", &m)
                .or_empty_str()
                .is_true_like()
        {
            // Validate that required fields are set
            for (key, val) in &c.labels.to_map() {
                if val.is_empty() {
                    return Err(errorf(&format!(
                        "{}: Component.{} is a mandatory field",
                        &comp.name, key
                    )));
                }
            }

            // Grow the components vector
            components.push(c);
        }
    }

    Ok(components)
}

/// Parses nested hierarchical schematic definitions present in the given KiCad schematic
fn parse_sub_schematics(tree: &SchematicTree) -> DynamicResult<Vec<Schematic>> {
    let mut sub_schematics = Vec::new();

    // Recursively traverse and parse the sub-schematics
    for (id, schematic) in tree.sub_schematics.iter() {
        sub_schematics.push(parse_schematic(schematic, id.clone())?);
    }

    Ok(sub_schematics)
}

// get_component_attr gets the component attribute value for a case-sensitive key, but returns
// None if the value is "" or "~"
fn get_component_attr(comp: &kicad_schematic::Component, key: &str) -> Option<String> {
    comp.get_field_value(key).filter_empty()
}

// get_component_attr_mapped works like get_component_attr, but allows "key" to be case-insensitive, as long as
// "key" exists in hashmap "m" which maps the case-insensitive key to a case-sensitive key that can be used for
// get_component_attr
fn get_component_attr_mapped(
    comp: &kicad_schematic::Component,
    key: &str,
    m: &HashMap<String, String>,
) -> Option<String> {
    m.get(key)
        .map(|attr_key| get_component_attr(comp, attr_key))
        .flatten()
}

// IsTrueLike provides an is_true_like that turns a type into a bool given type-specific heuristic
// rules.
trait IsTrueLike {
    fn is_true_like(&self) -> bool;
}

impl<T: AsRef<str>> IsTrueLike for T {
    // is_true_like returns true is s is a "true-like" string like "true" or "1", otherwise false
    fn is_true_like(&self) -> bool {
        self.as_ref() == "true" || self.as_ref() == "1"
    }
}

// OrEmptyStr provides an or_empty_str method that unwraps a string option in a safe way,
// defaulting to an empty string if None. The inner string is cloned.
trait OrEmptyStr {
    // or_empty_str unwraps the string-like option such that if opt is None, a new, empty String is returned
    fn or_empty_str(&self) -> String;
}

impl OrEmptyStr for Option<String> {
    fn or_empty_str(&self) -> String {
        self.clone().unwrap_or_else(|| String::new())
    }
}

impl OrEmptyStr for Option<&str> {
    fn or_empty_str(&self) -> String {
        self.unwrap_or("").into()
    }
}

// EmptyFilter provides a filter_empty method that filters a string or string option into a
// string option, making sure "empty-like" strings make the option become None.
trait EmptyFilter {
    fn filter_empty(&self) -> Option<String>;
}

impl EmptyFilter for &str {
    // filter_empty trims the string reference s, and returns it as owned in an Option if non-empty.
    // As a special case, "~" also counts as "empty".
    fn filter_empty(&self) -> Option<String> {
        let s = self.trim();
        if s.is_empty() || s == "~" {
            None
        } else {
            Some(s.into())
        }
    }
}

impl<T: AsRef<str>> EmptyFilter for Option<T> {
    // filter_empty passes the string through &str.filter_empty if the option is Some. In other words,
    // this function maps Some("") and Some("~") -> None, and lets all other values be.
    fn filter_empty(&self) -> Option<String> {
        match self {
            Some(s) => s.as_ref().filter_empty(),
            None => None,
        }
    }
}

// SplitCharN provides a split_char_n method that can be used to split a string by a given
// character, and then return an option wrapping the n-th split match.
trait SplitCharN {
    fn split_char_n(&self, split_char: char, idx: usize) -> Option<String>;
}

impl SplitCharN for &str {
    fn split_char_n(&self, split_char: char, idx: usize) -> Option<String> {
        self.split(split_char).nth(idx).map(|s| s.into())
    }
}

impl<T: AsRef<str>> SplitCharN for Option<T> {
    fn split_char_n(&self, split_char: char, idx: usize) -> Option<String> {
        match self {
            Some(s) => s.as_ref().split_char_n(split_char, idx),
            None => None,
        }
    }
}

trait OrDefault<'a, T> {
    fn or_default(self, default: T) -> T;
}

impl<'a, T: Default + PartialEq> OrDefault<'a, T> for T {
    fn or_default(self, default: T) -> T {
        if self == Default::default() {
            return default;
        }

        self
    }
}

// This is a workaround for broken string escaping in kicad_parse_gen.
// TODO: Fix escaping issue upstream and remove this.
fn unescape(s: &str) -> String {
    let mut res = String::new();
    let mut prev = 0 as char;

    let mut iter = s.chars().peekable();
    while let Some(c) = iter.next() {
        let mut next_prev = c;
        match c {
            '\\' => {
                if prev == '\\' {
                    res.push('\\');
                    next_prev = 0 as char; // Remove duplicate backslashes
                } else if iter.peek().map(|next| next != &'\\').unwrap_or(true) {
                    res.push('"'); // A lone backslash is actually a missing double quote
                }
            }
            c => res.push(c),
        }
        prev = next_prev;
    }

    res
}

// This is a workaround for broken string escaping in kicad_parse_gen.
// TODO: Fix escaping issue upstream and remove this.
fn escape(s: &str) -> String {
    let mut res = String::new();

    for c in s.chars() {
        match c {
            '"' => res.push_str(r#"\""#), // Escape backslashes
            c => res.push(c),
        }
    }

    res
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_unescape() {
        assert_eq!(r#"\""#, unescape(r"\\\"));
        assert_eq!(
            r#"vdiv(5.1, "(R1+\R2\\)/R2*0.8", 'E96', 500e3, 700e3)"#,
            unescape(r"vdiv(5.1, \(R1+\\R2\\\\)/R2*0.8\, 'E96', 500e3, 700e3)")
        )
    }

    #[test]
    fn test_escape() {
        assert_eq!(r#"\\""#, escape(r#"\""#));
        assert_eq!(
            r#"vdiv(5.1, \"E1*(R1+R2)/R2\", \"E96\", (500e3, 700e3), (0.8))"#,
            escape(r#"vdiv(5.1, "E1*(R1+R2)/R2", "E96", (500e3, 700e3), (0.8))"#)
        )
    }
}
