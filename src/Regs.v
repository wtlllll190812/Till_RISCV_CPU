module Regs(addrA,addrB,addrD,dataA,dataB,dataD);
input  wire[4:0] addrA,addrB,addrD;
input wire[31:0] dataD;

output reg[31:0] dataA,dataB;
reg [31:0] regs[31:0];

integer i;
initial begin
    for (i =0 ;i<32 ;i=i+1 ) begin
        regs[i]=1;
    end
end

always @(*) begin
    dataA=regs[addrA];
    dataB=regs[addrB];
    regs[addrD]=dataD;
end
endmodule