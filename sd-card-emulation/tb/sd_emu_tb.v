`timescale 1ps/1ps

module sd_emu_tb;

vlog_tb_utils vtu();

reg clk = 0;
always #1 clk=~clk;

sd_emu_top dut(
    .CLK(clk)
);



initial begin
    $display("Hello, world!");
    # 10000;
    $finish;
end

endmodule
