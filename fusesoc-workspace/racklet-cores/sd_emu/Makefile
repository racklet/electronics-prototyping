CORE=racklet:playground:sd_emu


.PHONY: synth wave sim show

sim:
	fusesoc run --target=sim $(CORE) --vcd

synth:
	fusesoc run --target=synth $(CORE)

show:
	fusesoc core show $(CORE)
