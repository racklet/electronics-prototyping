`timescale 1ns/1ns

module wb_wrapper (
    input  wire         wb_clk_i,
	input  wire         wb_rst_i,

	input  wire [31:0]  wb_adr_i,
    output wire [31:0]  wb_dat_o,
    input  wire [3:0]   wb_sel_i,
	input  wire         wb_cyc_i,
	input  wire         wb_stb_i,
    input  wire         wb_we_i,
    output reg          wb_ack_o
);

    // BRAM connections
    wire       a_wr;
    wire [9:0] a_addr;
    wire [7:0] a_din;

    wire [9:0] b_addr = 511;
    wire [7:0] b_dout;
    // assign PIN_10 = b_dout[1];

    spi_flash_ctrl #(
        .BLOCK_SIZE     ( 512 )
    ) ctrl (
        // Connections to system logic
        .i_clk              ( i_clk      ),
        .i_read_addr        ( 24'd0      ),
        .i_read_stb         ( btn_down   ), // read enable (start read transaction)
        .o_read_done_stb    ( PIN_10     ),

        // Connections to BRAM
        .o_write_bram_stb   ( a_wr       ),
        .o_read_bram_addr   ( a_addr     ),
        .o_read_bram_data   ( a_din      ),

        // Connections to SPI flash
        .o_spi_cs_n         ( o_spi_cs_n ),
        .o_spi_clk          ( o_spi_clk  ),
        .o_spi_mosi         ( o_spi_mosi ),
        .i_spi_miso         ( i_spi_miso )
    );

    sd_bram_block_dp  #(
        .DATA ( 8 ),    // byte addressable
        .ADDR ( 9 )     // 512 locations
    ) bram (
        // Write port for data read from SPI flash
        .a_clk      ( i_clk  ),
        .a_wr       ( a_wr   ),
        .a_addr     ( a_addr ),
        .a_din      ( a_din  ),
        // leave a_dout unconnected

        // Read-only port for WB interface
        .b_clk      ( i_clk  ),
        .b_wr       ( 1'b0   ),  // read-only port 
        .b_addr     ( wb_adr_i[9:0] ),
        .b_dout     ( b_dout )
        // leave b_din unconnected
    );

    assign wb_dat_o = {24'd0, b_dout};

endmodule



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
