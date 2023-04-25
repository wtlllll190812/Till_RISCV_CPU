module Mux3to1(
    input wire[31:0] in1,in2,in3,
    input wire[1:0] sel,
    output wire[31:0] out
    );

assign out=(sel==2'b00)?in1:((sel==2'b01)?in2:in3);

endmodule