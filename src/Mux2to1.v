module Mux2to1(
    input wire[31:0] in1,in2,
    input sel,
    output wire[31:0] out
    );

assign out=sel?in2:in1;
endmodule