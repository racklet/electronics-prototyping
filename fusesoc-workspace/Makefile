.PHONY: wave sim

wave:
	gtkwave -S sim.tcl ./build/racklet_cores_sd_emu_0.0.1/sim-icarus/testlog.vcd

sim:
	fusesoc run --target=sim racklet:cores:sd_emu --vcd --firmware ${PWD}/bootblob.hex

