`timescale 1ns/1ns

module bidir_tb;

vlog_tb_utils vtu();

reg clk = 0;
always #1 clk=~clk;

reg btn = 1;

reg zero = 0;

wire io_data;
wire io_data_in;
assign io_data_in = io_data;

reg io_data_out = 0;
reg io_data_out_en = 0;
assign io_data = io_data_out_en ? io_data_out : 1'bz;

reg stb = 0;

echo dut(
    .i_clk(clk),
    .io_data(io_data),
    .i_stb(stb)
);

    localparam [7:0] testdata = 8'h81;


    initial begin
        #10 stb = 1;
        #2  stb = 0;
    end

    initial begin
        #12

        io_data_out_en = 1;
        for (integer i = 0; i < 8; i++) begin
            io_data_out = testdata[7-i];
            #2;
        end
        io_data_out_en = 0;

        #200;

        $finish;
    end

endmodule
