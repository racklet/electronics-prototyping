`default_nettype none

module wb_spi_flash_ctrl(
    // Wishbone interface
	input  wire         wb_clk_i,
	input  wire         wb_rst_i,

	input  wire [31:0]  wb_adr_i,
    output reg  [31:0]  wb_dat_o,
	input  wire [31:0]  wb_dat_i,
    input  wire [3:0]   wb_sel_i,
	input  wire         wb_cyc_i,
	input  wire         wb_stb_i,
    input  wire         wb_we_i,
    output reg          wb_ack_o,
	// input  wire [2:0]   wb_cti_i,
	// input  wire [1:0]   wb_bte_i,

    // SPI flash
    output wire         o_spi_cs_n, // SPI flash chip select (active low)   pin 15
    output wire         o_spi_clk,  // SPI flash serial clock               pin 14
    output wire         o_spi_mosi, // SPI flash master to slave data       pin 13
    input  wire         i_spi_miso  // SPI flash slave to master data       pin 12
);

    reg wb_cyc_i_last;
    wire wb_cyc_i_rising = wb_cyc_i & ~wb_cyc_i_last;

    reg [3:0] state;
    localparam [3:0] ST_IDLE            = 4'd1,
                     ST_READ_BLOCK      = 4'd2,
                     ST_ACK_BLOCK_READ  = 4'd3;

    // BRAM connections
    wire       a_wr;
    wire [9:0] a_addr;
    wire [7:0] a_din;

    //reg block_read_stb;
    wire block_aligned_addr = wb_adr_i[9:0] == 10'b0;
    wire block_read_stb = wb_cyc_i_rising && block_aligned_addr;
    wire block_read_done;

    spi_flash_ctrl #(
        .BLOCK_SIZE     ( 1024 )
    ) ctrl (
        // Connections to system logic
        .i_clk              ( wb_clk_i        ),
        .i_read_addr        ( wb_adr_i[23:0]  ),
        .i_read_stb         ( block_read_stb  ), // read enable (start read transaction)
        .o_read_done_stb    ( block_read_done ),

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
        .DATA ( 8 ),        // byte addressable
        .ADDR ( 10 )        // 1024 locations
    ) bram (
        // Write port for data read from SPI flash
        .a_clk      ( wb_clk_i  ),
        .a_wr       ( a_wr   ),
        .a_addr     ( a_addr ),
        .a_din      ( a_din  ),
        // leave a_dout unconnected

        // Read-only port for WB interface
        .b_clk      ( wb_clk_i      ),
        .b_wr       ( 1'b0          ),  // read-only port 
        .b_addr     ( wb_adr_i[9:0] ),

        // FIXME: Convert 8-bit wide bram to 32-bit wishbone...
        // Either:
        //   * split bram block to four smaller bram blocks to get four read ports for 32-bit output per cycle, or
        //   * read over 4 cycles with a state machine


        .b_dout     ( wb_dat_o      )
        // leave b_din unconnected
    );

    always @(posedge wb_clk_i) begin
        wb_cyc_i_last <= wb_cyc_i;

        case(state)
            ST_IDLE: begin
                if (block_read_stb) begin
                    state <= ST_READ_BLOCK;
                end
            end

            ST_READ_BLOCK: begin
                if (block_read_done) begin
                    state <= ST_ACK_BLOCK_READ;
                end
            end

            ST_ACK_BLOCK_READ: begin
                state <= ST_IDLE;
            end

            default: begin
                state <= ST_IDLE;
            end
        endcase

        // module reset
        if (wb_rst_i)
            state <= ST_IDLE;
    end

    always @(*) begin
        if (block_aligned_addr)
            wb_ack_o = state == ST_ACK_BLOCK_READ;
        else
            wb_ack_o = wb_stb_i && wb_cyc_i;
    end

endmodule