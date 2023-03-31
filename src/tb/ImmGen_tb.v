`timescale 1ns / 1ps
module ImmGen_tb;
    reg[11:0]  inst_imm;
    wire[31:0] imm;
    wire immSel=1;
    ImmGen immGen_inst(.inst_imm(inst_imm),.imm(imm),.immSel(immSel));
    initial begin
        #100 inst_imm=-12'd12;
        #100 inst_imm=-12'd1;
        #100 inst_imm=-12'd456;
        #100 inst_imm=12'd8;
        #100 $stop;
    end
endmodule