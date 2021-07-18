# Electronics Prototyping

This repository holds the designs for various hardware prototypes.

## kicad_rs sample usage

First, `cd tools/kicad/kicad_rs` when running from source.

### Evaluator

Reads from Stdin: No
Writes to Stdout: No
Command line arguments:

1. Schematic file to evaluate, will update in-place

```bash
# This command will update the file in place
cargo run --bin=evaluator ../../../hat-psu/hat-psu/BD9E302EFJ-5V1.sch
```

### Parser

Reads from Stdin: No
Writes to Stdout: Yes
Command line arguments:

1. Schematic file to parse

```bash
# Or any other .sch file. This command writes to stdout, you can save it in a
# file like this or pipe it to the classifier.
cargo run --bin=parser ../../../hat-psu/hat-psu/BD9E302EFJ-5V1.sch > parsed.yaml
```

### Classifier

Reads from Stdin: Yes
Writes to Stdout: Yes
Command line arguments:

1. Policy file written in CUE to use. A sample file is given in `tools/kicad/kicad_rs/sample_policy.cue`

```bash
# Read from the parsed file like this and save to a file, or...
cat parsed.yaml | cargo run --bin=classifier sample_policy.cue > classified.yaml

# ... pipe the output from the parser like this (writes to stdout)
cargo run --bin=parser ../../../hat-psu/hat-psu/BD9E302EFJ-5V1.sch | cargo run --bin=classifier sample_policy.cue
```

## Contributing

Please see [CONTRIBUTING.md](CONTRIBUTING.md) and our [Code Of Conduct](CODE_OF_CONDUCT.md).

Other interesting resources include:

- [The issue tracker](https://github.com/racklet/racklet/issues)
- [The discussions forum](https://github.com/racklet/racklet/discussions)
- [The list of milestones](https://github.com/racklet/racklet/milestones)
- [The roadmap](https://github.com/orgs/racklet/projects/1)
- [The changelog](https://github.com/racklet/racklet/blob/main/CHANGELOG.md)

## Getting Help

If you have any questions about, feedback for or problems with Racklet:

- Invite yourself to the [Open Source Firmware Slack](https://slack.osfw.dev/).
- Ask a question on the [#racklet](https://osfw.slack.com/messages/racklet/) slack channel.
- Ask a question on the [discussions forum](https://github.com/racklet/racklet/discussions).
- [File an issue](https://github.com/racklet/racklet/issues/new).
- Join our [community meetings](https://hackmd.io/@racklet/Sk8jHHc7_) (see also the [meeting-notes](https://github.com/racklet/meeting-notes) repo).

Your feedback is always welcome!

## Maintainers

In alphabetical order:

- Dennis Marttinen, [@twelho](https://github.com/twelho)
- Jaakko Sirén, [@Jaakkonen](https://github.com/Jaakkonen)
- Lucas Käldström, [@luxas](https://github.com/luxas)
- Verneri Hirvonen, [@chiplet](https://github.com/chiplet)

## License

[Apache 2.0](LICENSE)
