module Ram(addr,sel,dataWrite,data);
output reg[31:0] data;
input wire[31:0] addr,dataWrite;
input wire[3:0] sel;

reg[7:0] mem[0:4095];

initial begin
    $readmemh ("../data/ram.data", mem);
end

always @(addr or sel or dataWrite) begin
    case(sel[3:1])
        3'b000:begin 
            if(sel[0])data={{24{mem[addr][7]}},mem[addr]}; //符号拓展
            else mem[addr]=dataWrite[7:0];
        end
        3'b001:begin 
            if(sel[0])data={{16{mem[addr][7]}},mem[addr],mem[addr+1]};            
            else {mem[addr],mem[addr+1]}=dataWrite[15:0];
        end
        3'b010:begin 
            if(sel[0])data={mem[addr],mem[addr+1],mem[addr+2],mem[addr+3]};
            else {mem[addr],mem[addr+1],mem[addr+2],mem[addr+3]}=dataWrite;
        end
        3'b100:begin 
            data={{24{1'h0}},mem[addr]}; //符号拓展
        end
        3'b101:begin 
            data={{16{1'h0}},mem[addr],mem[addr+1]}; //符号拓展
        end
        default:begin
        end
    endcase
end
endmodule