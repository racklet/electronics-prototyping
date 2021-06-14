use std::collections::HashMap;
use evalexpr::{Context, ContextWithMutableVariables, HashMapContext};

pub struct Expression {
	expr: String,
	namespace: String, // TODO: This
}

impl Expression {
	pub fn new(expr: String, namespace: String) -> Self {
		Self {
			expr,
			namespace,
		}
	}
}

pub fn resolve(expressions: &HashMap<String, Expression>) -> HashMapContext {
	let mut c = HashMapContext::new();

	for id in expressions.keys() {
		println!("{}", id);
		evaluate(&mut c, expressions, id.to_owned());
	}

	c
}

fn evaluate<T: Context + ContextWithMutableVariables>(c: &mut T, e: &HashMap<String, Expression>, id: String) {
	if c.get_value(&id).is_some() {
		println!("Already resolved: {}", id);
		return;
	}

	let node = evalexpr::build_operator_tree(&e[&id].expr).expect("no err"); // TODO: Error handling
	for dep in node.iter_variable_identifiers() {
		println!("Recursive call for: {}", dep);
		evaluate(c, e, String::from(dep));
	}

	c.set_value(id, node.eval_with_context(c).unwrap()).unwrap(); // TODO: Error handling
}
