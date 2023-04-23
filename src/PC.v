module PC(clk,addrPc,newPcAddr,pcSel);
input wire clk,pcSel;
input wire[31:0] newPcAddr;
output reg[31:0]  addrPc;

reg[31:0] data=32'd0;
initial begin
    addrPc=0;
end
always @(posedge clk) begin
    if(pcSel)
        data=newPcAddr;

    addrPc=data;
    data=data+4;
end
endmodule