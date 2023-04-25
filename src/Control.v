module Control (
    input wire[31:0] inst,
    input wire eq,lt,
    output reg dataASel,dataBSel,pcSel,immSel,regsWriteEn,
    output reg[1:0] writeDataSel,
    output reg[3:0] aluMode,
    output reg[3:0] ramMode,
    output reg[12:0] immInputData
);

always @(inst) begin
    pcSel=0;
    dataASel=0;
    dataBSel=0;
    immSel=0;
    writeDataSel=2'b00;
    regsWriteEn=1;
    aluMode=4'b0000;
    case(inst[6:0])
        7'b0110011:begin                   //R型指令
            aluMode={inst[14:12],inst[30]};
        end
        7'b0010011:begin                   //算术I型指令
            dataBSel=1; 
            immSel=1;
            aluMode={inst[14:12],inst[30]};
            immInputData={1'b0,inst[31:20]};
        end
        7'b0000011:begin                   //加载I型指令
            immSel=1;
            dataBSel=1;
            writeDataSel=2'b01;
            immInputData={1'b0,inst[31:20]};
            ramMode={inst[14:12],1'b0};
        end
        7'b0100011:begin                   //S型指令
            regsWriteEn=0;
            immSel=1;
            dataBSel=1;
            immInputData={1'b0,inst[31:25],inst[11:7]};
            ramMode={inst[14:12],1'b1};
        end
        7'b1100011:begin                   //SB型指令
            immSel=1;
            dataASel=1;
            dataBSel=1;
            immInputData={inst[31],inst[7],inst[30:25],inst[11:8],1'b0};
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
            writeDataSel=2'b10;
            immInputData={1'b0,inst[31:20]};
        end
        default:begin
		
        end
    endcase
end
endmodule 