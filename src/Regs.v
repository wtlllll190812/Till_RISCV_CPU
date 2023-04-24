module Regs(addrA,addrB,addrD,dataA,dataB,dataD,wEn,clk);
input wire[4:0] addrA,addrB,addrD;
input wire[31:0] dataD;
input wire wEn;
input wire clk;

output reg[31:0] dataA,dataB;
reg [31:0] regs[31:0];

integer i;
initial begin
    regs[0]=0;
    for (i =1 ;i<32 ;i=i+1 ) begin
        regs[i]=0;
    end
end

always @(addrA or addrB or addrD) begin
    dataA=regs[addrA];
    dataB=regs[addrB];  
end

always @(posedge clk)
begin
    if(wEn&&addrD!=5'd0) begin
        regs[addrD]=dataD;
    end
end
endmodule