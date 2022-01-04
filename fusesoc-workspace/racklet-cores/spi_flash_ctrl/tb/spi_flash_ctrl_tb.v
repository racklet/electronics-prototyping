`timescale 1ns/1ns

module spi_flash_ctrl_tb;

vlog_tb_utils vtu();

reg clk = 0;
always #62 clk=~clk;

reg btn = 1;

reg zero = 0;

wire flash_cs;
wire flash_clk;
wire flash_mosi;
wire flash_miso;
wire flash_wp_n;
wire flash_reset_n;
assign flash_wp_n = 1;
assign flash_reset_n = 1;

spiflash spiflash_model (
	.csb(flash_cs),
	.clk(flash_clk),
	.io0(flash_mosi),
	.io1(flash_miso),
	.io2(flash_wp_n),
	.io3(flash_reset_n)
);

spi_flash_ctrl_top dut(
    .i_clk(clk),
    .i_btn(btn),
    .o_spi_cs_n(flash_cs),
    .o_spi_clk(flash_clk),
    .o_spi_mosi(flash_mosi),
    .i_spi_miso(flash_miso)
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
