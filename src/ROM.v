module Rom(addr,data,en);
output reg[31:0] data;
input wire[31:0] addr;
input wire en;

reg[31:0] mem[0:4095];

initial begin
    mem[0]=32'h1b;
    mem[1]=32'h2c;
    mem[2]=32'h9a;
    mem[3]=32'h2d;
end

always @(addr or en) begin
    if(en)begin
        data=mem[addr];
    end
end
endmodule