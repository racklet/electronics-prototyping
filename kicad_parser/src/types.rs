use serde::{Deserialize, Serialize};

// These types are used to structure the YAML-formatted output

#[derive(Serialize, Deserialize, Debug)]
#[serde(rename_all = "camelCase")]
pub struct Schematic {
    // The "top-level" schematic has id ""
    pub id: String,
    pub meta: SchematicMeta,
    #[serde(skip_serializing_if = "Vec::is_empty")]
    pub globals: Vec<Attribute>,
    #[serde(skip_serializing_if = "Vec::is_empty")]
    pub components: Vec<Component>,
    #[serde(skip_serializing_if = "Vec::is_empty")]
    pub sub_schematics: Vec<Schematic>,
}

#[derive(Serialize, Deserialize, Debug)]
#[serde(rename_all = "camelCase")]
pub struct SchematicMeta {
    pub file_name: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub title: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub date: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub revision: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub company: Option<String>,
    #[serde(skip_serializing_if = "Vec::is_empty")]
    pub comments: Vec<String>,
}

#[derive(Serialize, Deserialize, Debug)]
#[serde(rename_all = "camelCase")]
pub struct Component {
    pub reference: String,
    pub footprint_name: String,
    pub footprint_library: String,
    pub symbol_name: String,
    pub symbol_library: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub model: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub datasheet: Option<String>,
    #[serde(skip_serializing_if = "Vec::is_empty")]
    pub classes: Vec<String>,
    #[serde(skip_serializing_if = "Vec::is_empty")]
    pub attributes: Vec<Attribute>,
}

impl Component {
    pub fn attribute_by_name(&self, name: &str) -> Option<&Attribute> {
        self.attributes.iter().find(|&a| a.name == name)
    }
}

#[derive(Serialize, Deserialize, Debug)]
#[serde(rename_all = "camelCase")]
pub struct Attribute {
    pub name: String,
    pub value: String,
    pub expression: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub unit: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub comment: Option<String>,
}

#[derive(Serialize, Deserialize, Debug)]
#[serde(rename_all = "camelCase")]
pub struct ComponentClassifier {
    pub class: String,
    // Match constraints
    pub footprint_name: Option<String>,
    pub footprint_library: Option<String>,
    pub symbol_name: Option<String>,
    pub symbol_library: Option<String>,
    // Attribute matching
    pub attributes: Vec<AttributeMatch>,
}

#[derive(Serialize, Deserialize, Debug)]
#[serde(rename_all = "camelCase")]
pub struct AttributeMatch {
    pub name: String,
    pub value: Option<String>,
    // TODO: Maybe in the future add a negation here
}
