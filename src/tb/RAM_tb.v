`timescale 1ns / 1ps
module RAM_tb;
    reg[31:0] addr;
    reg[31:0] dataWrite;
    reg[3:0] sel;
    wire[31:0] data;

    RAM RAM_inst(.addr(addr),.sel(sel),.dataWrite(dataWrite),.data(data));
    initial begin
        dataWrite=1234;
        addr=0;
        sel=0000;
        #100;
        repeat(16)begin
            addr=addr+4;
            sel=sel+1;
            #100;
        end
        #100 $stop;
    end
endmodule