`default_nettype none

module wb_spi_flash_ctrl(
    // Wishbone interface
	input  wire         wb_clk_i,
	input  wire         wb_rst_i,

	input  wire [31:0]  wb_adr_i,
    output wire [31:0]  wb_dat_o,
	input  wire [31:0]  wb_dat_i,
    input  wire [3:0]   wb_sel_i,
	input  wire         wb_cyc_i,
	input  wire         wb_stb_i,
    input  wire         wb_we_i,
    output reg          wb_ack_o,
	// input  wire [2:0]   wb_cti_i,
	// input  wire [1:0]   wb_bte_i,

    input  wire         abort_mission, // stop current transfer and move to idle state

    // SPI flash
    output wire         o_spi_cs_n, // SPI flash chip select (active low)   pin 15
    output wire         o_spi_clk,  // SPI flash serial clock               pin 14
    output wire         o_spi_mosi, // SPI flash master to slave data       pin 13
    input  wire         i_spi_miso  // SPI flash slave to master data       pin 12
);
    reg wb_cyc_i_last, wb_we_i_last;
    wire wb_cyc_i_rising = wb_cyc_i & ~wb_cyc_i_last;

    reg [3:0] state;
    localparam [3:0] ST_IDLE            = 4'd1,
                     ST_READ_BLOCK      = 4'd2,
                     ST_ACK_BLOCK_READ  = 4'd3,
                     ST_BRAM_A          = 4'd4,
                     ST_BRAM_D          = 4'd5;

    // BRAM connections
    wire       a_wr;
    wire [9:0] bram_waddr;
    wire [7:0] a_din;

    reg  [7:0] b_addr = 10'b0;

    //reg block_read_stb;
    wire block_aligned_addr = wb_adr_i[9:0] == 10'b0;
    wire block_read_stb = wb_cyc_i_rising && block_aligned_addr;
    wire unaligned_read_stb = !wb_ack_o && wb_cyc_i && wb_stb_i && !block_aligned_addr;
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
        .o_write_bram_addr  ( bram_waddr ),
        .o_write_bram_data  ( a_din      ),

        // Connections to SPI flash
        .o_spi_cs_n         ( o_spi_cs_n ),
        .o_spi_clk          ( o_spi_clk  ),
        .o_spi_mosi         ( o_spi_mosi ),
        .i_spi_miso         ( i_spi_miso )
    );

    wire [1:0] wr_block_index = bram_waddr[1:0];
    wire [7:0] wr_block_addr  = bram_waddr[9:2];
    wire [1:0] rd_block_index = wb_adr_i[1:0];
    wire [7:0] rd_block_addr  = wb_adr_i[9:2];

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin
            wire a_wr_idx = a_wr && (wr_block_index == i);
            bram_dp  #(
                .DATA ( 8 ),        // byte addressable
                .ADDR ( 8 )         // 4*256 = 1024 locations
            ) bram (
                // Write port for data read from SPI flash
                .a_clk      ( wb_clk_i      ),
                .a_wr       ( a_wr_idx      ),
                .a_addr     ( wr_block_addr ),
                .a_din      ( a_din         ),
                // TODO: test if this is legal syntax
                //.a_dout     (               ), // leave a_dout unconnected

                // Read-only port for WB interface
                .b_clk      ( wb_clk_i      ),
                .b_wr       ( 1'b0          ),  // read-only port 
                .b_addr     ( rd_block_addr ),
                //.b_dout     ( wb_dat_o[8*(3-i)+7:8*(3-i)] )
                .b_dout     ( wb_dat_o[8*i+7:8*i] )
                // leave b_din unconnected
            );
        end
    endgenerate

    always @(posedge wb_clk_i) begin
        wb_cyc_i_last <= wb_cyc_i;
        wb_we_i_last <= wb_we_i;

        case(state)
            ST_IDLE: begin
                if (block_read_stb) begin
                    state <= ST_READ_BLOCK;
                end else if (unaligned_read_stb) begin
                    b_addr <= wb_adr_i[9:0];
                    state <= ST_BRAM_A;
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

            ST_BRAM_A: begin
                state <= ST_BRAM_D;
            end

            ST_BRAM_D: begin
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
        else if (wb_we_i_last && wb_stb_i && wb_cyc_i)
            wb_ack_o = 1'b0;
        else
            wb_ack_o = wb_stb_i && wb_cyc_i && (state == ST_BRAM_D);
    end

endmodule