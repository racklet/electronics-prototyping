FUSESOC_WORKSPACE=../..
CORE=racklet:cores:sd_emu

.PHONY: synth wave sim show

sim:
	cd $(FUSESOC_WORKSPACE) && fusesoc run --target=sim $(CORE) --vcd

lint:
	cd $(FUSESOC_WORKSPACE) && fusesoc run --target=lint $(CORE)

synth_ice40:
	cd $(FUSESOC_WORKSPACE) && fusesoc run --target=synth_ice40 $(CORE)

synth_ecp5:
	@echo TODO: Configure ulx3s implementation

show:
	cd $(FUSESOC_WORKSPACE) && fusesoc core show $(CORE)
