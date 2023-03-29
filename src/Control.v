module Control (inst,aluSel);
input wire[31:0] inst;
output reg aluSel;

always @(inst) begin
    case(inst[6:0])
        7'b0110011:begin
            aluSel=1;
        end
        default:begin
            aluSel=0;
        end
    endcase
end
endmodule 