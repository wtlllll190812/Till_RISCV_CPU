module ImmGen(
    input wire signed[12:0] inst_imm,
    input immSel,
    output reg signed[31:0]imm);

always @(inst_imm or immSel) begin
    if(immSel)begin
        imm=inst_imm;//自动符号拓展
    end
end
endmodule