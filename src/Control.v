module Control (
    input wire[31:0] inst,
    output reg bSel,immSel,wDataSel,regsWEn,
    output reg[3:0] aluSel,
    output reg[3:0] ramSel,
    output reg[11:0] immInputData
);

always @(inst) begin
    aluSel=4'b0000;
    bSel=0;
    immSel=0;
    wDataSel=0;
    regsWEn=1;
    case(inst[6:0])
        7'b0110011:begin                   //R型指令
            aluSel={inst[14:12],inst[30]};
        end
        7'b0010011:begin                   //算术I型指令
            bSel=1; 
            immSel=1;
            aluSel={inst[14:12],inst[30]};
            immInputData=inst[31:20];
        end
        7'b0000011:begin                   //加载I型指令
            immSel=1;
            bSel=1;
            wDataSel=1;
            ramSel={inst[14:12],1'b1};
            immInputData=inst[31:20];
        end
        7'b0100011:begin                   //S型指令
            regsWEn=0;
            immSel=1;
            bSel=1;
            ramSel={inst[14:12],1'b0};
        end
        default:begin
		
        end
    endcase
end
endmodule 