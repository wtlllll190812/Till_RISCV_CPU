module cpu_top(clk);
input clk;

wire [31:0] addrPc;
PC pc_inst(.addrPc(addrPc),.clk(clk));
wire [31:0] inst;
Rom rom_inst(.addr(addrPc),.data(inst),.en(1));
wire [31:0] dataA,dataB,dataD;
Regs regs_inst(.addrA(inst[19:15]),.addrB(inst[24:20]),.addrD(inst[11:7]),.dataA(dataA),.dataB(dataB),.dataD(dataD));
wire aluSel;
Control Control_inst(.inst(inst),.aluSel(aluSel));
ALU alu_inst(.ra(dataA),.rb(dataB),.en(aluSel),.op(inst[14:12]),.func7(inst[30]),.out(dataD));
endmodule