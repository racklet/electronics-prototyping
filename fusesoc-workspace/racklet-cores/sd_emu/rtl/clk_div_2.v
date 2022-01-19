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