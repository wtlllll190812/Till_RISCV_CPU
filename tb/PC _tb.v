`timescale 1ns / 1ps
module PC_tb;
    reg clk=0;
    wire[31:0] addrPc;
    
    always #100 clk = ~clk;     // 5MHz
    PC pc_inst(.clk(clk),.addrPc(addrPc));
    initial begin
        #1000 $stop;
    end
endmodule