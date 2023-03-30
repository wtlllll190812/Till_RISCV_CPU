module PC(clk,addrPc);
input wire clk;
output reg[31:0]  addrPc;
initial begin
    addrPc=0;
end
always @(posedge clk) begin
    addrPc=addrPc+4;
end
endmodule