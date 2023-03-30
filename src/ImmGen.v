module ImmGen(
    input wire signed[11:0] inst_imm,
    input immSel,
    output reg signed[31:0]imm);

always @(*) begin
    if(immSel)begin
        imm=inst_imm;//自动符号拓展
    end
end
endmodule