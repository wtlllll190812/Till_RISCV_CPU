`timescale 1ns / 1ps
module Regs_tb;
reg [4:0] addrA,addrB,addrD;
reg[31:0] dataD;
wire [31:0] dataA,dataB;

Regs regs_inst(.addrA(addrA),.addrB(addrB),.addrD(addrD),.dataA(dataA),.dataB(dataB),.dataD(dataD));

initial begin
    addrA=5'd3;
    addrB=5'd4;
    addrD=5'd8;
    dataD=32'd127;
    #100
    
    addrA=5'd3;
    addrB=5'd4;
    addrD=5'd3;
    dataD=32'd145;
    #100
    
    addrA=5'd3;
    addrB=5'd4;
    addrD=5'd4;
    dataD=32'd137;
    #100
    
    addrA=5'd3;
    addrB=5'd4;
    addrD=5'd8;
    dataD=32'd5653;
    #100 $stop;
end

endmodule