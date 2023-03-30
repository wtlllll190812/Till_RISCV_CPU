module Control (inst,aluSel,bSel,immSel);
input wire[31:0] inst;
output reg aluSel,bSel,immSel;

always @(inst) begin
    aluSel=0;
    bSel=0;
    immSel=0;
    case(inst[6:0])
        7'b0110011:begin
            aluSel=1;
        end
        7'b0010011:begin
           bSel=1; 
           immSel=1;
        end
        default:begin
        end
    endcase
end
endmodule 