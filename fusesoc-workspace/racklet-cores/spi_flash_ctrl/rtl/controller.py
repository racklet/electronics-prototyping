from amaranth import Signal, Elaboratable, Module, Memory
from amaranth.sim import Tick, Settle
from amaranth.sim import Simulator
from amaranth_soc import wishbone
from amaranth_soc.memory import MemoryMap
from math import ceil, log2

class HelloWorld(Elaboratable):
    def __init__(self):
        self.cnt = Signal(24)
        self.led = Signal()
    
    def elaborate(self, platform):
        m = Module()
        if platform is not None:
            self.led = platform.request('led', 0)
        
        m.d.sync += self.cnt.eq(self.cnt + 1)
        m.d.comb += self.led.eq(self.cnt[21])

        return m

class WbMaster(Elaboratable):
    def __init__(self):
        pass

    def elaborate(self, platform):
        m = Module()
        return m

class ROM(Elaboratable, wishbone.Interface):
    def __init__(self, data):
        self.size = len(data)
        self.data = Memory(width=32, depth=self.size, init=data)
        self.r = self.data.read_port()
        wishbone.Interface.__init__(self, addr_width=ceil(log2(self.size+1)), data_width=32)
        self.memory_map = MemoryMap(data_width=self.data_width, addr_width=self.addr_width, alignment=0)

    def elaborate(self, platform):
        m = Module()
        m.submodules.r = self.r
        m.d.sync += self.ack.eq(0)
        with m.If(self.cyc):
            m.d.sync += self.ack.eq(self.stb)
        m.d.comb += [
            self.r.addr.eq(self.adr),
            self.dat_r.eq(self.r.data)
        ]
        return m

def rom_read_ut(rom, address, expected):
    yield rom.adr.eq(address)
    yield Tick()
    yield Settle()
    actual = yield rom.dat_r
    if expected == actual:
        print("PASS: Memory[0x%04x] = 0x%08x" % (address, expected))
    else:
        print("FAIL: Memory[0x%04x] = 0x%08x (got: 0x%08x)" % (address, expected, actual))

if __name__=='__main__':
    dut = ROM([0x12345678, 0xaaaaaaaa])
    sim = Simulator(dut)
    sim.add_clock(1e-6)
    def bench():
        yield from rom_read_ut(dut, 0, 0x12345678)
        yield from rom_read_ut(dut, 1, 0xaaaaaaaa)
    sim.add_sync_process(bench)
    with sim.write_vcd("rom.vcd"):
        sim.run()

class SpiFlashController():
    ...



# build design
from amaranth_boards.tinyfpga_bx import *
if __name__=='__main__':
    # sim
    dut = HelloWorld()
    def bench():
        for _ in range(300):
            yield
    sim = Simulator(dut)
    sim.add_clock(1e-6)
    sim.add_sync_process(bench)
    with sim.write_vcd("hello_world.vcd"):
        sim.run()

    # synth
    dut = HelloWorld()
    TinyFPGABXPlatform().build(dut, do_program=False)