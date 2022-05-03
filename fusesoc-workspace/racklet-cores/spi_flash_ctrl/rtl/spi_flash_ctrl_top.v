`default_nettype none

module spi_flash_ctrl_top(
    input  wire i_clk,      // 16MHz clock
    output wire o_led,      // User/boot LED next to power LED

    // SPI flash
    output wire o_spi_cs_n, // SPI flash chip select (active low)   pin 15
    output wire o_spi_clk,  // SPI flash serial clock               pin 14
    output wire o_spi_mosi, // SPI flash master to slave data       pin 13
    input  wire i_spi_miso, // SPI flash slave to master data       pin 12

    // Push Button
    input  wire i_btn,      //                                      pin 16
    output wire PIN_10,     // probe

    output wire USBPU       // USB pull-up resistor
);

    // drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 0;

    wire btn_down;
    PushButton_Debouncer debouncer(
        .clk(i_clk),
        .PB(i_btn),
        .PB_down(btn_down)
    );

    // BRAM connections
    wire       a_wr;
    wire [8:0] a_addr;
    wire [7:0] a_din;

    wire [8:0] b_addr = 511;
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
        .b_addr     ( b_addr ),
        .b_dout     ( b_dout )
        // leave b_din unconnected
    );

endmodule
