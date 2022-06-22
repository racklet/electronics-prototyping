`default_nettype none

module spi_flash_ctrl #(
    parameter [10:0] BLOCK_SIZE = 512,
    parameter [7:0]  SPI_CLK_DIV = 10
) (
    // connections to system logic
    input  wire         i_clk,              // System clock input
    input  wire [23:0]  i_read_addr,        // Block read start address (byte-addressed)
    input  wire         i_read_stb,         // Start read transaction
    output reg          o_read_done_stb,    // Read completion strobe

    // connections to BRAM
    output reg          o_write_bram_stb,   // Write byte available strobe
    output reg  [9:0]   o_write_bram_addr,  // Write byte address modulo BLOCK_SIZE
    output reg  [7:0]   o_write_bram_data,  // Write byte data

    // connections to SPI flash
    output reg          o_spi_cs_n,         // SPI flash chip select (active low)
    output reg          o_spi_clk,          // SPI flash serial clock
    output reg          o_spi_mosi,         // SPI flash master to slave data
    input  wire         i_spi_miso          // SPI flash slave to master data
);

    initial begin
        o_spi_cs_n = 1;
        o_spi_clk = 1;
    end

    // flash read FSM
    localparam [2:0] S_IDLE         = 3'h0,
                     S_START        = 3'h1,
                     S_SHIFT_CMD    = 3'h2,
                     S_SHIFT_ADDR   = 3'h3,
                     S_SHIFT_DATA   = 3'h4;

    reg [2:0] state = S_IDLE;
    localparam [7:0] READ_CMD = 8'h03;

    reg        bit_done     = 0;
    reg [3:0]  cmd_counter  = 0;
    reg [7:0]  cmd_pipe     = 8'hf;
    reg [4:0]  addr_counter = 0;
    reg [23:0] addr_pipe    = 24'hffffff;

    // SPI clock strobe
    reg [7:0]  spi_clk_cnt = 0;
    always @(posedge i_clk) begin
        if (spi_clk_stb || i_read_stb)
            spi_clk_cnt <= SPI_CLK_DIV;
        else
            spi_clk_cnt <= spi_clk_cnt - 1;
    end
    wire spi_clk_stb = (spi_clk_cnt == 0);

    reg [7:0] read_byte = 0;
    reg [3:0] read_bits = 0;
    reg [10:0] read_bytes = 0; // number of bytes read

    // mosi
    always @(*) begin
        case(state)
            S_IDLE:       o_spi_mosi = 1'b1;
            S_START:      o_spi_mosi = 1'b1;
            S_SHIFT_CMD:  o_spi_mosi = cmd_pipe[7];
            S_SHIFT_ADDR: o_spi_mosi = addr_pipe[23];
            S_SHIFT_DATA: o_spi_mosi = 1'b1;
            default:      o_spi_mosi = 1'b1;
        endcase
    end

    // fsm logic
    // TODO: rewrite with clear separation between combinational and sequential logic
    always @(posedge i_clk) begin
        o_write_bram_stb <= 1'b0;
        o_read_done_stb <= 1'b0;
        case(state)
            S_IDLE: begin
                o_spi_cs_n <= 1;
                o_spi_clk <= 1;

                // start read transaction
                if (i_read_stb) begin
                    state <= S_START;

                    o_spi_cs_n <= 0;
                    bit_done <= 0;
                end
            end

            // "start" bit for asserting CS before command bits
            S_START: begin
                if (spi_clk_stb) begin
                    bit_done <= !bit_done;

                    if (bit_done) begin
                        state <= S_SHIFT_CMD;

                        bit_done <= 0;
                        cmd_pipe <= READ_CMD;
                        cmd_counter <= 7;
                        o_spi_clk <= 0;
                    end
                end
            end
            
            S_SHIFT_CMD: begin
                if (spi_clk_stb) begin
                    bit_done <= !bit_done;
                    o_spi_clk <= !o_spi_clk;

                    if (bit_done) begin
                        if (cmd_counter == 0) begin
                            state <= S_SHIFT_ADDR;

                            addr_pipe <= i_read_addr;
                            addr_counter <= 23;
                        end

                        cmd_counter <= cmd_counter-1;
                        cmd_pipe <= cmd_pipe << 1;
                    end
                end
            end
            
            S_SHIFT_ADDR: begin
                if (spi_clk_stb) begin  
                    bit_done <= !bit_done;
                    o_spi_clk <= !o_spi_clk;

                    if (bit_done) begin
                        if (addr_counter == 0) begin
                            state <= S_SHIFT_DATA;
                        end

                        addr_counter <= addr_counter-1;
                        addr_pipe <= addr_pipe << 1;
                    end
                end
            end
            
            S_SHIFT_DATA: begin
                if (spi_clk_stb) begin                    
                    o_spi_clk <= ~o_spi_clk;
                    if (o_spi_clk == 0)
                    begin
                        // shift bit in from MISO line (msb first)
                        read_byte <= {read_byte[6:0], i_spi_miso};
                        read_bits <= read_bits+1;

                        // write byte to bram after reading last bit
                        if (read_bits == 7) begin
                            o_write_bram_stb <= 1;
                            o_write_bram_data <= {read_byte[6:0], i_spi_miso};
                            o_write_bram_addr <= read_bytes[9:0];
                        end
                    end else if (o_spi_clk == 1) begin
                        if (read_bits == 8) begin
                            // reset counters for next byte
                            read_bits <= 0;
                            read_bytes <= read_bytes+1;
                            
                            // Go to IDLE state after read is done
                            if (read_bytes+1 == BLOCK_SIZE) begin
                                state <= S_IDLE;
                                read_bytes <= 0;
                                o_spi_clk <= 1;
                                o_read_done_stb <= 1'b1;
                            end
                        end
                    end
                end
            end 

            default: begin
                state <= S_IDLE;
            end
        endcase
    end

endmodule