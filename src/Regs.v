module Regs(addrA,addrB,addrD,dataA,dataB,dataD,wEn);
input  wire[4:0] addrA,addrB,addrD;
input wire[31:0] dataD;
input wire wEn;

output reg[31:0] dataA,dataB;
reg [31:0] regs[31:0];

integer i;
initial begin
    regs[0]=0;
    for (i =1 ;i<32 ;i=i+1 ) begin
        regs[i]=1;
    end
end

always @(addrA or wEn or addrB or addrD) begin
    dataA=regs[addrA];
    dataB=regs[addrB];
    if(wEn&&addrD!=5'd0)
        regs[addrD]=dataD;
end
endmodule