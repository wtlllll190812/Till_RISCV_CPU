`timescale 1ns / 1ps
module ALU_tb;

reg signed[31:0]  ra,rb;
wire signed[31:0]  out;

reg[2:0] op;  
reg en,func3;

ALU alu_inst(.ra(ra),.rb(rb),.en(en),.func3(func3),.op(op),.out(out));

initial begin
    op=0;
    en=1;
    ra=32'd8;
    rb=32'd4;
    repeat(8)
        #100 op=op+1;
    ra=32'd148;
    rb=-32'd20;
    repeat(8)
        #100 op=op+1;
    #100 $stop;
end
endmodule