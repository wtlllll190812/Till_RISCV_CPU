module cpu_top(
    input wire clk
);

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
wire signed [20:0] imm_input;
ImmGen immGen_inst(
    .inst_imm(imm_input),
    .immSel(ImmSel),
    .imm(imm)
    );

wire [31:0] dataA,dataB,dataD;
wire [1:0] write_sel;
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
    .dataA(dataA),
    .dataB(dataB),
    .eq(eq),
    .lt(lt)
    );

wire [3:0] alu_mode;
wire [3:0] ram_mode;
Control Control_inst(
    .inst(inst),
    .eq(eq),
    .lt(lt),
    .immSel(ImmSel),
    .dataASel(dataASel),
    .dataBSel(dataBSel),
    .write_sel(write_sel),
    .regsWriteEn(regsWriteEn),
    .ram_mode(ram_mode),
    .alu_mode(alu_mode),
    .pcSel(pcSel),
    .imm_input(imm_input)
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
    .dataA(aluDataA),
    .dataB(aluDataB),
    .sel(alu_mode),
    .out(aluDataOut)
    );

wire [31:0] RamOut;
RAM ram_inst(
    .addr(aluDataOut),
    .data(RamOut),
    .dataWrite(dataB),
    .sel(ram_mode)
    );
    
Mux3to1 Mux3to1_wData(
    .in1(aluDataOut),
    .in2(RamOut),
    .in3(addrPc+4),
    .sel(write_sel),
    .out(dataD)
    );

endmodule