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

module echo(
    input  wire i_clk,
    input  wire i_stb,
    inout       io_data
);

    wire io_data_in;
    reg  io_data_out = 0;
    reg  io_data_out_en = 0;
    assign io_data = io_data_out_en ? io_data_out : 1'bz;

    reg listen = 0;
    localparam [7:0] READ_COUNT = 8;
    reg [7:0] bits_read = 0;
    reg [READ_COUNT-1:0] data = 0;

    localparam [7:0] WAIT_CYCLES = 32;
    reg [7:0] wait_counter;

    localparam [1:0]    S_IDLE = 0,
                        S_LISTEN = 1,
                        S_WAIT = 2,
                        S_REPEAT = 3;
    reg [1:0] state = S_IDLE;

    always @(posedge i_clk) begin
        if (state == S_IDLE) begin
            if (i_stb) begin
                state <= S_LISTEN;
                bits_read <= 0;
            end
        end
        else if (state == S_LISTEN) begin
            if (bits_read == READ_COUNT-1) begin
                state <= S_WAIT;
                wait_counter <= 0;
            end

            data <= {data[READ_COUNT-2:0], io_data};
            bits_read <= bits_read + 1;
        end
        else if (state == S_WAIT) begin
            if (wait_counter == WAIT_CYCLES-1) begin
                state <= S_REPEAT;
                io_data_out_en <= 1;
                io_data_out <= data[READ_COUNT-1];
                data <= data << 1;
            end
            wait_counter <= wait_counter + 1;
        end
        else if (state == S_REPEAT) begin
            if (bits_read == 8'h01) begin
                state <= S_IDLE;
                io_data_out_en <= 0;
            end
            io_data_out <= data[READ_COUNT-1];
            data <= data << 1;
            bits_read <= bits_read - 1;
        end

        if (listen) begin

        end
    end

endmodule

module bidir_top(
    input  wire i_clk,      // 16MHz clock
    output wire o_led,      // User/boot LED next to power LED

    // Push Button
    input wire i_btn,       //                                      pin 16

    // Probe outputs
    output wire o_probe,    //                                      pin 11

    output wire USBPU       // USB pull-up resistor
);

    // drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 0;

endmodule
