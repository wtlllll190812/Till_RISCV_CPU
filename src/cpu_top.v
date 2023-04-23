module cpu_top(clk);
input clk;


wire [31:0] addrPc;
wire pcSel;
PC pc_inst(
    .addrPc(addrPc),
    .newPcAddr(newPcAddr),
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
wire [11:0] immInputData;
ImmGen immGen_inst(
    .inst_imm(immInputData),
    .immSel(ImmSel),
    .imm(imm)
    );

wire [31:0] dataA,dataB,dataD;
wire dataBSel,dataASel,writeDataSel,regsWriteEn;
Regs regs_inst(
    .addrA(inst[19:15]),
    .addrB(inst[24:20]),
    .addrD(inst[11:7]),
    .dataA(dataA),
    .dataB(dataB),
    .dataD(dataD),
    .wEn(regsWriteEn)
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
    .pcSel(pcSel)
);

wire [31:0] aluDataA,aluDataB;
wire [31:0] aluDataOut;
Mux mux_dataBSel(
    .in1(dataB),
    .in2(imm),
    .sel(dataBSel),
    .out(aluDataB)
    );

Mux mux_dataASel(
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
Mux mux_wData(
    .in1(aluDataOut),
    .in2(RamOut),
    .sel(writeDataSel),
    .out(dataD)
    );

endmodule