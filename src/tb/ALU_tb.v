`timescale 1ns / 1ps
module ALU_tb;

reg signed[31:0]  dataA,dataB;
wire signed[31:0]  out;

reg[2:0] op;  
reg en,func7;

ALU alu_inst(.dataA(dataA),.dataB(dataB),.en(en),.func7(func7),.op(op),.out(out));

initial begin
    op=0;
    en=1;
    dataA=32'd8;
    dataB=32'd4;
    repeat(8)
        #100 op=op+1;
    dataA=32'd148;
    dataB=-32'd20;
    repeat(8)
        #100 op=op+1;
    #100 $stop;
end
endmodule