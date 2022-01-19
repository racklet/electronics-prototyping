module latch(en, din, dout);
input en, din;
output dout;

always @* 
    if (en)
        dout <= din;

endmodule
