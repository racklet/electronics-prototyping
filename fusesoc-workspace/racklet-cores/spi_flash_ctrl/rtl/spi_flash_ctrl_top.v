`default_nettype none

// divide clock signal by a factor of two
module clk_div_2(
    input i_clk,
    output o_clk
);

    reg counter = 0;
    always @(posedge i_clk)
        counter <= counter + 1;
    assign o_clk = counter;

endmodule


module controller(
    // connections to system logic
    input  wire i_clk,      // System clock input
    input  wire i_re,       // Start read transaction
    output reg  o_read_stb, // Read byte available strobe

    // connections to SPI flash
    output reg  o_spi_cs_n, // SPI flash chip select (active low)
    output reg  o_spi_clk,  // SPI flash serial clock
    output reg  o_spi_mosi, // SPI flash master to slave data
    input  wire i_spi_miso  // SPI flash slave to master data
);

    initial begin
        o_spi_cs_n = 1;
        o_spi_clk = 1;
        o_spi_mosi = 1;
    end

    // flash read FSM
    localparam [3:0] S_IDLE = 3'h0;
    localparam [3:0] S_START = 3'h1;
    localparam [3:0] S_SHIFT_CMD = 3'h2;
    localparam [3:0] S_SHIFT_ADDR = 3'h3;
    localparam [3:0] S_SHIFT_DATA = 3'h4;

    reg [3:0] state = S_IDLE;
    localparam [7:0] READ_CMD = 8'h03;
    localparam [23:0] READ_ADDR = 24'h0;

    reg [3:0]  cmd_counter;
    reg [7:0]  cmd_pipe;
    reg [4:0]  addr_counter;
    reg [23:0] addr_pipe;

    localparam [9:0] READ_SIZE = 512;
    reg [7:0] read_byte = 0;
    reg [3:0] read_bits = 0;
    reg [9:0] read_bytes = 0; // number of read bytes

    // fsm logic
    always @(posedge i_clk) begin
        if (state == S_IDLE)
        begin
            // start read transaction
            if (i_re)
            begin
                state <= S_START;

                o_spi_cs_n <= 0;
                cmd_pipe <= READ_CMD;
                addr_pipe <= READ_ADDR;
            end else
            begin
                o_spi_cs_n <= 1;
                o_read_stb <= 0;
            end
        end else if (state == S_START)
        begin
            state <= S_SHIFT_CMD;
            // set index and write most significant bit
            cmd_counter <= 7;
            o_spi_mosi <= cmd_pipe[7];
            cmd_pipe <= cmd_pipe << 1;
            o_spi_clk <= 0;
        end else if (state == S_SHIFT_CMD)
        begin
            if (cmd_counter == 0 && o_spi_clk == 1)
            begin
                state <= S_SHIFT_ADDR;

                addr_counter <= 23;
                o_spi_mosi <= addr_pipe[23];
                addr_pipe <= addr_pipe << 1;
            end

            if (o_spi_clk == 1)
            begin
                o_spi_mosi <= cmd_pipe[7];
                cmd_counter <= cmd_counter-1;
                cmd_pipe <= cmd_pipe << 1;
            end
            o_spi_clk <= ~o_spi_clk;
        end else if (state == S_SHIFT_ADDR)
        begin
            if (addr_counter == 0 && o_spi_clk == 1)
            begin
                state <= S_SHIFT_DATA;
            end
            if (o_spi_clk == 1)
            begin
                o_spi_mosi <= addr_pipe[23];
                addr_counter <= addr_counter-1;
                addr_pipe <= addr_pipe << 1;
            end
            o_spi_clk <= ~o_spi_clk;
        end else if (state == S_SHIFT_DATA) begin
            if (o_spi_clk == 0)
            begin
                read_byte <= {read_byte[6:0], i_spi_miso};
                read_bits <= read_bits+1;
            end
            o_spi_clk <= ~o_spi_clk;
            // generate ready byte strobe
            if (read_bits == 8 && o_spi_clk == 1) begin
                o_read_stb <= 1;
                read_bits <= 0;
                read_bytes <= read_bytes+1;
                
                // TODO: remove, this moves to idle state after reading one byte
                if (read_bytes+1 == READ_SIZE) begin
                    state <= S_IDLE;
                    read_bytes <= 0;
                end
            end else begin
                o_read_stb <= 0;
            end
        end else
        begin
            // go to a known state
            state <= S_IDLE;
        end
    end

endmodule


module spi_flash_ctrl_top(
    input  wire i_clk,      // 16MHz clock
    output wire o_led,      // User/boot LED next to power LED

    // SPI flash
    output wire o_spi_cs_n, // SPI flash chip select (active low)   pin 15
    output wire o_spi_clk,  // SPI flash serial clock               pin 14
    output wire o_spi_mosi, // SPI flash master to slave data       pin 13
    input  wire i_spi_miso, // SPI flash slave to master data       pin 12

    // Push Button
    input wire i_btn,       //                                      pin 16

    // Probe outputs
    output wire o_probe,    //                                      pin 11

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
    // assign o_probe = btn_down; // probe button down pulse

    controller ctrl(
    .i_clk(i_clk),
    .o_spi_cs_n(o_spi_cs_n),
    .o_spi_clk(o_spi_clk),
    .o_spi_mosi(o_spi_mosi),
    .i_spi_miso(i_spi_miso),
    .i_re(btn_down) // read enable (start read transaction)
);

endmodule
