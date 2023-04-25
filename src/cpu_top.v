module cpu_top(clk);
input clk;


wire [31:0] addrPc;
wire [31:0] aluDataOut;
wire pcSel;
PC pc_inst(
    .addrPc(addrPc),
    .newPcAddr(aluDataOut),
    .clk(clk),
    .pcSel(pcSel)
    );

wire [31:0] inst;
Rom rom_inst(
    .addr(addrPc),
    .data(inst),
    .en(1)
    );

wire ImmSel;
wire [31:0] imm;
wire [12:0] immInputData;
ImmGen immGen_inst(
    .inst_imm(immInputData),
    .immSel(ImmSel),
    .imm(imm)
    );

wire [31:0] dataA,dataB,dataD;
wire [1:0] writeDataSel;
wire dataBSel,dataASel,regsWriteEn;
Regs regs_inst(
    .addrA(inst[19:15]),
    .addrB(inst[24:20]),
    .addrD(inst[11:7]),
    .dataA(dataA),
    .dataB(dataB),
    .dataD(dataD),
    .wEn(regsWriteEn),
    .clk(clk)
    );

wire eq,lt;
Comp comp_inst(
    .a(dataA),
    .b(dataB),
    .eq(eq),
    .lt(lt)
    );

wire [3:0] aluMode;
wire [3:0] ramMode;
Control Control_inst(
    .inst(inst),
    .aluMode(aluMode),
    .immSel(ImmSel),
    .dataBSel(dataBSel),
    .ramMode(ramMode),
    .writeDataSel(writeDataSel),
    .regsWriteEn(regsWriteEn),
    .immInputData(immInputData),
    .dataASel(dataASel),
    .pcSel(pcSel),
    .eq(eq),
    .lt(lt)
);

wire [31:0] aluDataA,aluDataB;
Mux2to1 Mux2to1_dataBSel(
    .in1(dataB),
    .in2(imm),
    .sel(dataBSel),
    .out(aluDataB)
    );

Mux2to1 Mux2to1_dataASel(
    .in1(dataA),
    .in2(addrPc),
    .sel(dataASel),
    .out(aluDataA)
    );
    
ALU alu_inst(
    .ra(aluDataA),
    .rb(aluDataB),
    .sel(aluMode),
    .out(aluDataOut)
    );

wire [31:0] RamOut;
RAM ram_inst(
    .addr(aluDataOut),
    .data(RamOut),
    .dataWrite(dataB),
    .sel(ramMode)
    );
Mux3to1 Mux3to1_wData(
    .in1(aluDataOut),
    .in2(RamOut),
    .in3(addrPc+4),
    .sel(writeDataSel),
    .out(dataD)
    );

endmodule