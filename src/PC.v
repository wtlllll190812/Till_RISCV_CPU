module PC(clk,addrPc);
input wire clk;
output reg[31:0]  addrPc;

reg[31:0] data=32'd0;
initial begin
    addrPc=0;
end
always @(posedge clk) begin
    addrPc=data;
    data=data+4;
end
endmodule