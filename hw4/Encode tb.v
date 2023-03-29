`timescale 1ns / 1ps

module Encode_tb;
reg[3:0] D;
wire x,y,V;
Encode encode(.D(D),.x(x),.y(y),.V(V));

initial begin
    D=0;
    repeat(16)
        #100 D=D+1;
    #100  $stop;
end

endmodule //Encode