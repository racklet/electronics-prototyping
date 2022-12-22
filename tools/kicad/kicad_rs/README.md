# `kicad_rs`

## kicad_rs sample usage

First, `cd tools/kicad/kicad_rs` when running from source.

### Evaluator

* Reads from Stdin: No
* Writes to Stdout: No

Command line arguments:

1. Schematic file to evaluate, will update in-place

```bash
# This command will update the file in place
cargo run --bin=evaluator ../../../hat-psu/hat-psu/BD9E302EFJ_5V1.sch
```

### Parser

* Reads from Stdin: No
* Writes to Stdout: Yes

Command line arguments:

1. Schematic file to parse

```bash
# Or any other .sch file. This command writes to stdout, you can save it in a
# file like this or pipe it to the classifier.
cargo run --bin=parser ../../../hat-psu/hat-psu/BD9E302EFJ_5V1.sch > parsed.yaml
```

### Classifier

* Reads from Stdin: Yes
* Writes to Stdout: Yes

Command line arguments:

1. Policy file written in CUE to use. A sample file is given in `tools/kicad/kicad_rs/sample_policy.cue`

```bash
# Read from the parsed file like this and save to a file, or...
cat parsed.yaml | cargo run --bin=classifier sample_policy.cue > classified.yaml

# ... pipe the output from the parser like this (writes to stdout)
cargo run --bin=parser ../../../hat-psu/hat-psu/BD9E302EFJ_5V1.sch | cargo run --bin=classifier sample_policy.cue
```