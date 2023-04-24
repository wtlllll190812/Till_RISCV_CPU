module PC(clk,addrPc,newPcAddr,pcSel);
input wire clk,pcSel;
input wire[31:0] newPcAddr;
output reg[31:0]  addrPc;

reg[31:0] data=32'd0;
initial begin
    addrPc=-4;
end
always @(posedge clk) begin
    if(pcSel)begin
        data=newPcAddr;
        addrPc=data;
        end
    else begin
        addrPc=data;
    end
    data=data+4;
end
endmodule