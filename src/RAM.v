module RAM(
    output reg[31:0] data,
    input wire[31:0] addr,dataWrite,
    input wire[3:0] sel
    );

reg[7:0] mem[0:4095];

initial begin
    $readmemh ("../data/ram.data", mem);
end

always @(addr or sel or dataWrite) begin
    case(sel[3:1])
        3'b000:begin //sb和lb
            if(sel[0]) mem[addr]=dataWrite[7:0];//符号拓展
            else data={{24{mem[addr][7]}},mem[addr]};
        end
        3'b001:begin //sh和lh
            if(sel[0]){mem[addr],mem[addr+1]}=dataWrite[15:0];
            else data={{16{mem[addr][7]}},mem[addr],mem[addr+1]};  
        end
        3'b010:begin //sw和lw
            if(sel[0]){mem[addr],mem[addr+1],mem[addr+2],mem[addr+3]}=dataWrite;
            else data={mem[addr],mem[addr+1],mem[addr+2],mem[addr+3]};
        end
        3'b100:begin //sd
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