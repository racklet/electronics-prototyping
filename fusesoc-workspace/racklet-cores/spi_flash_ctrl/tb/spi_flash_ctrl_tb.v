`timescale 1ns/1ns

module spi_flash_ctrl_tb;

vlog_tb_utils vtu();

reg clk = 0;
always #62 clk=~clk;

reg btn = 1;

reg zero = 0;

spi_flash_ctrl_top dut(
    .i_clk(clk),
    .i_btn(btn),
    .i_spi_miso(zero)
);



initial begin
    $display("Hello, world!");
    #10000000;
    $finish;
end

// push button press
initial begin
    #262;
    // push button + simulate bounce
    btn = 0;
    #10000
    btn = 1;

    // #30000;
    // // push button + simulate bounce
    // btn = 0;
    // #10000
    // btn = 1;
end

endmodule
