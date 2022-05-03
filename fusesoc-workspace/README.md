# SD Emulator

## Quickstart

### Running Simulation
Requires at least the following tools:
* icarus verilog
* fusesoc

Simulation can be executed with the following command:
```shell
$ fusesoc run --target=sim racklet:cores:sd_emu --vcd --firmware ${PWD}/bootblob.hex
```

If successful, this will generate a file called `testlog.vcd` to `./build/racklet_cores_sd_emu_<version>/sim-icarus/`, which can be opened with a waveform viewer such as GTKWave.