module Rom(addr,data,en);
output reg[31:0] data;
input wire[31:0] addr;
input wire en;

reg[7:0] mem[0:4095];

initial begin
    // mem[3]=8'h01;
    // mem[2]=8'h24;
    // mem[1]=8'h82;
    // mem[0]=8'hB3;
    $readmemh ("../data/rom.data", mem);
end

always @(addr or en) begin
    if(en)begin
        data[7:0]=mem[addr+3];
        data[15:8]=mem[addr+2];
        data[23:16]=mem[addr+1];
        data[31:24]=mem[addr];
    end
end
endmodule