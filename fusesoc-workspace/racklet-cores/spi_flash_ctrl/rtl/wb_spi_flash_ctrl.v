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
	input  wire [2:0]   wb_cti_i,
	input  wire [1:0]   wb_bte_i,

    // SPI flash
    output wire o_spi_cs_n, // SPI flash chip select (active low)   pin 15
    output wire o_spi_clk,  // SPI flash serial clock               pin 14
    output wire o_spi_mosi, // SPI flash master to slave data       pin 13
    input  wire i_spi_miso  // SPI flash slave to master data       pin 12
);

    reg wb_cyc_i_last;
    wire wb_cyc_i_rising = wb_cyc_i & ~wb_cyc_i_last;

    reg [3:0] state;
    localparam [3:0] ST_IDLE            = 4'd1,
                     ST_READ_BLOCK      = 4'd2,
                     ST_WAIT_FOR_STB    = 4'd3,
                     ST_BRAM_1          = 4'd4,
                     ST_BRAM_2          = 4'd5,
                     ST_BRAM_3          = 4'd6,
                     ST_BRAM_4          = 4'd7;

    // BRAM connections
    wire       a_wr;
    wire [8:0] a_addr;
    wire [7:0] a_din;

    reg  [9:0] b_addr = 0;
    wire [7:0] b_dout;

    reg block_read_stb;
    wire block_read_done;

    spi_flash_ctrl #(
        .BLOCK_SIZE     ( 512 )
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
        .DATA ( 8 ),    // byte addressable
        .ADDR ( 9 )     // 512 locations
    ) bram (
        // Write port for data read from SPI flash
        .a_clk      ( wb_clk_i  ),
        .a_wr       ( a_wr   ),
        .a_addr     ( a_addr ),
        .a_din      ( a_din  ),
        // leave a_dout unconnected

        // Read-only port for WB interface
        .b_clk      ( wb_clk_i  ),
        .b_wr       ( 1'b0   ),  // read-only port 
        .b_addr     ( b_addr ),
        .b_dout     ( b_dout )
        // leave b_din unconnected
    );

    always @(posedge wb_clk_i) begin
        wb_cyc_i_last <= wb_cyc_i;
        wb_ack_o <= 1'b0;
        block_read_stb <= 0;

        case(state)
            ST_IDLE: begin
                if (wb_cyc_i_rising) begin
                    b_addr <= 0;
                    block_read_stb <= 1;
                    state <= ST_READ_BLOCK;
                end
            end

            ST_READ_BLOCK: begin
                if (block_read_done) begin
                    state <= ST_WAIT_FOR_STB;
                end
            end

            ST_WAIT_FOR_STB: begin
                if (wb_stb_i) begin
                    b_addr <= b_addr + 1;
                    state <= ST_BRAM_1;
                end
            end

            ST_BRAM_1: begin
                b_addr <= b_addr + 1;
                // wb_dat_o[7:0] <= b_dout;
                wb_dat_o[31:24] <= b_dout;
                state <= ST_BRAM_2;
            end

            ST_BRAM_2: begin
                b_addr <= b_addr + 1;
                // wb_dat_o[15:8] <= b_dout;
                wb_dat_o[23:16] <= b_dout;
                state <= ST_BRAM_3;
            end

            ST_BRAM_3: begin
                b_addr <= b_addr + 1;
                // wb_dat_o[23:16] <= b_dout;
                wb_dat_o[15:8] <= b_dout;
                state <= ST_BRAM_4;
            end

            ST_BRAM_4: begin
                // wb_dat_o[31:24] <= b_dout;
                wb_dat_o[7:0] <= b_dout;
                wb_ack_o <= 1'b1;
                state <= ST_WAIT_FOR_STB;
                if (b_addr == 512) begin
                    state <= ST_IDLE;
                end
            end

            default: begin
                state <= ST_IDLE;
            end
        endcase

        // module reset
        if (wb_rst_i)
            state <= ST_IDLE;
    end

endmodule