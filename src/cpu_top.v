module cpu_top(clk);
input clk;

wire [31:0] addrPc;
PC pc_inst(.addrPc(addrPc),.clk(clk));

wire [31:0] inst;
Rom rom_inst(.addr(addrPc),.data(inst),.en(1));

wire ImmSel;
wire [31:0] imm;
ImmGen immGen_inst(.inst_imm(inst[31:20]),.immSel(ImmSel),.imm(imm));

wire [31:0] dataA,dataB,dataD;
Regs regs_inst(.addrA(inst[19:15]),.addrB(inst[24:20]),.addrD(inst[11:7]),.dataA(dataA),.dataB(dataB),.dataD(dataD));

wire [3:0] aluSel;
wire [2:0] ramSel;
wire bSel,wDataSel;
Control Control_inst(.inst(inst),.aluSel(aluSel),.immSel(ImmSel),.bSel(bSel),.ramSel(ramSel),.wDataSel(wDataSel));

wire [31:0] aluDataB;
wire [31:0] aluDataOut;
Mux mux_bSel(.in1(dataB),.in2(imm),.sel(bSel),.out(aluDataB));
ALU alu_inst(.ra(dataA),.rb(aluDataB),.sel(aluSel),.out(aluDataOut));

wire [31:0] RamOut;
Ram ram_inst(.addr(aluDataOut),.data(RamOut),.sel(ramSel));
Mux mux_wData(.in1(aluDataOut),.in2(RamOut),.sel(wDataSel),.out(dataD));
endmodule