`timescale 1ns / 1ps
module Control_tb;
reg[31:0] inst;
wire aluSel;
Control Control_inst(.inst(inst),.aluSel(aluSel));

initial begin
    #100 inst[6:0]=7'b0110011;
    #100 inst[6:0]=7'b0111011;
    #100 $stop;
end

endmodule