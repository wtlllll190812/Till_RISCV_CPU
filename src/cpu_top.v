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

wire aluSel,bSel;
Control Control_inst(.inst(inst),.aluSel(aluSel),.immSel(ImmSel),.bSel(bSel));

wire [31:0] aluDataB;
Mux mux_bSel(.in1(dataB),.in2(imm),.sel(bSel),.out(aluDataB));
ALU alu_inst(.ra(dataA),.rb(aluDataB),.en(aluSel),.op(inst[14:12]),.func7(inst[30]),.out(dataD));
endmodule