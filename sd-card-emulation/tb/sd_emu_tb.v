`timescale 1ns/10ps

module sd_emu_tb;

vlog_tb_utils vtu();

reg clk = 0;
always #2500 clk=~clk;

sd_emu_top dut(
    .CLK(clk)
);



initial begin
    $display("Hello, world!");
    #1000000;
    $finish;
end

endmodule
