module Control (inst,aluSel,bSel,immSel,wDataSel,ramSel);
input wire[31:0] inst;
output reg bSel,immSel,wDataSel;
output reg[3:0] aluSel;
output reg[2:0] ramSel;

always @(inst) begin
    aluSel=4'b0000;
    bSel=0;
    immSel=0;
    wDataSel=0;
    case(inst[6:0])
        7'b0110011:begin
            aluSel={inst[14:12],inst[30]};
        end
        7'b0010011:begin
            bSel=1; 
            immSel=1;
            aluSel={inst[14:12],inst[30]};
        end
        7'b0000011:begin
            immSel=1;
            bSel=1;
            ramSel=inst[14:12];
            wDataSel=1;
        end
        default:begin
        end
    endcase
end
endmodule 