use evalexpr::Value;
use std::fmt::{Display, Formatter, Result};

const UNITS_LARGE: &[char] = &['k', 'M', 'G', 'T', 'E'];
const UNITS_SMALL: &[char] = &['m', 'µ', 'n', 'p'];

pub struct PrettyPrintValue<'a> {
    value: &'a Value,
    unit: &'a Option<String>,
}

impl<'a> PrettyPrintValue<'a> {
    pub fn new(value: &'a Value, unit: &'a Option<String>) -> Self {
        Self { value, unit }
    }
}

impl<'a> Display for PrettyPrintValue<'a> {
    fn fmt(&self, f: &mut Formatter) -> Result {
        match self.value {
            Value::Float(mut float) => {
                let mut prefix = None;
                if let Some((mut iter, mul)) = match float {
                    _ if float == 0.0 => None,
                    _ if float.abs() > 1000.0 => Some((UNITS_LARGE.iter(), 0.001)),
                    _ if float.abs() < 1.0 => Some((UNITS_SMALL.iter(), 1000.0)),
                    _ => None,
                } {
                    while let (i @ Some(_), true) =
                        (iter.next(), float.abs() > 1000.0 || float.abs() < 1.0)
                    {
                        prefix = i;
                        float *= mul;
                    }
                }

                write!(f, "{:.2}", float)?; // Fixed two-decimal precision
                if self.unit.is_some() {
                    write!(f, " ")?;
                }

                prefix.map(|u| write!(f, "{}", u)).transpose()?;
                self.unit.as_ref().map(|u| write!(f, "{}", u)).transpose()?;

                Ok(())
            }
            other => {
                other.fmt(f)?;
                if let Some(unit) = self.unit {
                    write!(f, " {}", unit)?;
                }
                Ok(())
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    macro_rules! test_map {
        (($value:expr, $unit:expr, $target:expr)) => {
            assert_eq!(PrettyPrintValue::new(&$value.into(), &Some($unit.into())).to_string(), $target);
        };

        (($value:expr, $target:expr)) => {
            assert_eq!(PrettyPrintValue::new(&$value.into(), &None).to_string(), $target);
        };

        ($name:ident, $($x:tt),+) => {
            #[test]
            fn $name() {
                $(test_map!($x);)*
            }
        };
    }

    test_map!(ppv_integer, (10000, "pcs.", "10000 pcs."), (100, "100"));
    test_map!(
        ppv_string,
        ("test", "quantity", r#""test" quantity"#),
        ("test", r#""test""#)
    );
    test_map!(
        ppv_float1,
        (0.0, "F", "0.00 F"),
        (3.01, "F", "3.01 F"),
        (9.999, "€", "10.00 €")
    );
    test_map!(
        ppv_float2,
        (0.0, "0.00"),
        (3.0051, "3.01"),
        (9.999, "10.00")
    );
    test_map!(
        ppv_float_large,
        (12345.0, "C", "12.35 kC"),
        (12345.0, "12.35k"),
        (3e18, "3000.00E")
    );
    test_map!(
        ppv_float_small,
        (123e-6, "R", "123.00 µR"),
        (0.00123456, "1.23m"),
        (3e-15, "0.00p")
    );
}
