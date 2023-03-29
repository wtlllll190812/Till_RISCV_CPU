module Regs(addrA,addrB,addrD,dataA,dataB,dataD);
input  wire[4:0] addrA,addrB,addrD;
input wire[31:0] dataD;

output reg[31:0] dataA,dataB;

reg [31:0] regs[31:0];

always @(addrA or addrB or addrD) begin
    regs[addrD]=dataD;
    dataA=regs[addrA];
    dataB=regs[addrB];
end
endmodule