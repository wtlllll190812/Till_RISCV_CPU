module Mux(in1,in2,sel,out);
input wire[31:0] in1,in2;
input sel;
output wire[31:0] out;

assign out=sel?in1:in2;
endmodule