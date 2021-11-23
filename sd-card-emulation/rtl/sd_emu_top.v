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

module sd_emu_top(
    input CLK,    // 16MHz clock
    output LED,   // User/boot LED next to power LED
    output USBPU, // USB pull-up resistor
    output PIN_24, // probe PLL output
    output PIN_23, // probe PLL output
    output PIN_22 // probe PLL output
);

    wire pll_clk_200;
    wire pll_rst;

    parameter [79:0] PLL = "NONE";
    generate
        // Generate 200 MHz internal clock from PLL for synth target
        if ((PLL == "ICE40_CORE") || (PLL == "ICE40_PAD")) begin
            // internal 200MHz clock
            ice40_pll #(.PLL (PLL)) pll(
                .i_clk(CLK),
                .o_clk(pll_clk_200),
                .o_rst(pll_rst)
            );
        // Pass through clock input for simulation
        // TODO: This probably throws off the simulation timescale since the CLK
        // input signal is a 16 MHz clock signal, and it's being interpreted as
        // the 200 MHz internal clock signal
        end else begin
            assign pll_clk_200 = CLK;
            reg [4:0] rst_reg = 5'b11111;
            always @(posedge pll_clk_200)
                rst_reg <= {1'b0, rst_reg[4:1]};
            assign pll_rst = rst_reg[0];
        end
    endgenerate

    // derived clocks
    wire clk_200, clk_100, clk_50;
    assign clk_200 = pll_clk_200;
    clk_div_2 cdiv_100(
        .i_clk(clk_200),
        .o_clk(clk_100)
    );
    clk_div_2 cdiv_50(
        .i_clk(clk_100),
        .o_clk(clk_50)
    );

    assign PIN_24 = clk_200; // prove PLL output
    assign PIN_23 = clk_100; // prove PLL output
    assign PIN_22 = clk_50; // prove PLL output


    // drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 0;

    reg led = 1'b0;
    always @(posedge clk_50)
        led <= ~led;

    assign LED = led;

endmodule
