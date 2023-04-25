module Control (
    input wire[31:0] inst,
    input wire eq,lt,
    output reg dataASel,dataBSel,pcSel,immSel,regsWriteEn,
    output reg[1:0] write_sel,
    output reg[3:0] alu_mode,
    output reg[3:0] ram_mode,
    output reg signed[20:0] imm_input
);

always @(inst) begin
    //初始化设置
    pcSel=0;
    dataASel=0;
    dataBSel=0;
    immSel=0;
    write_sel=2'b00;
    regsWriteEn=1;
    alu_mode=4'b0000;

    case(inst[6:0])
        7'b0110011:begin                   //R型指令
            alu_mode={inst[14:12],inst[30]};
        end
        7'b0010011:begin                   //算术I型指令
            dataBSel=1; 
            immSel=1;
            alu_mode={inst[14:12],inst[30]};
            imm_input=inst[31:20];
        end
        7'b0000011:begin                   //加载I型指令
            immSel=1;
            dataBSel=1;
            write_sel=2'b01;
            imm_input=inst[31:20];
            ram_mode={inst[14:12],1'b0};
        end
        7'b0100011:begin                   //S型指令
            regsWriteEn=0;
            immSel=1;
            dataBSel=1;
            imm_input={inst[31:25],inst[11:7]};
            ram_mode={inst[14:12],1'b1};
        end
        7'b1100011:begin                   //SB型指令
            immSel=1;
            dataASel=1;
            dataBSel=1;
            imm_input={inst[31],inst[7],inst[30:25],inst[11:8],1'b0};
            case(inst[14:12])
                3'b000:if(eq)pcSel=1;
                3'b001:if((~lt))pcSel=1;
                3'b100:if((~lt))pcSel=1;
                3'b101:if(lt&&(~eq))pcSel=1;
                3'b110:if(lt&&(~eq))pcSel=1;
                3'b111:if(~eq)pcSel=1;
                default:begin
                end
            endcase
        end
        7'b1100111:begin                   //JI型指令
            pcSel=1;
            immSel=1;
            dataBSel=1;
            write_sel=2'b10;
            imm_input=inst[31:20];
        end
        7'b1101111:begin                   //UJ型指令
            pcSel=1;
            immSel=1;
            dataASel=1;
            dataBSel=1;
            write_sel=2'b10;
            imm_input={inst[31],inst[19:12],inst[20],inst[30:21],1'b0};
        end
        default:begin
		
        end
    endcase
end
endmodule 