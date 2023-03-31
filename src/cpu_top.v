module cpu_top(clk);
input clk;

wire [31:0] addrPc;
PC pc_inst(
    .addrPc(addrPc),
    .clk(clk)
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
wire bSel,wDataSel,regsWEn;
Regs regs_inst(
    .addrA(inst[19:15]),
    .addrB(inst[24:20]),
    .addrD(inst[11:7]),
    .dataA(dataA),
    .dataB(dataB),
    .dataD(dataD),
    .wEn(regsWEn)
    );

wire [3:0] aluSel;
wire [3:0] ramSel;
Control Control_inst(
    .inst(inst),
    .aluSel(aluSel),
    .immSel(ImmSel),
    .bSel(bSel),
    .ramSel(ramSel),
    .wDataSel(wDataSel),
    .regsWEn(regsWEn),
    .immInputData(immInputData)
);

wire [31:0] aluDataB;
wire [31:0] aluDataOut;
Mux mux_bSel(
    .in1(dataB),
    .in2(imm),
    .sel(bSel),
    .out(aluDataB)
    );
ALU alu_inst(
    .ra(dataA),
    .rb(aluDataB),
    .sel(aluSel),
    .out(aluDataOut)
    );

wire [31:0] RamOut;
Ram ram_inst(
    .addr(aluDataOut),
    .data(RamOut),
    .dataWrite(dataB),
    .sel(ramSel)
    );
Mux mux_wData(
    .in1(aluDataOut),
    .in2(RamOut),
    .sel(wDataSel),
    .out(dataD)
    );

endmodule