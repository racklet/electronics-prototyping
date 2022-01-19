`default_nettype none

// Ignores writes, Always reads 0x41 ('A').
module wb_a(
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
	input  wire [2:0]   wb_cti_i,
	input  wire [1:0]   wb_bte_i
);

wire valid = wb_cyc_i & wb_stb_i;

always @(posedge wb_clk_i) begin
    if (wb_rst_i) begin
        wb_ack_o <= 0;
    end else begin
        wb_ack_o <= 0;
        if(valid)
            wb_ack_o <= 1;
    end
end

localparam A_CHAR = 32'h41414141;
assign wb_dat_o = A_CHAR;

endmodule