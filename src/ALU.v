module ALU(
    input wire signed[31:0] dataA,dataB,
    input wire [3:0] sel,
    output reg signed[31:0] out
);


always @(*) begin
    case(sel)
        4'b0001:begin       //sub
            out = dataA-dataB;
        end
        4'b0000:begin       //add
            out = dataA+dataB;
        end        
        4'b0010:begin       //sll
            out = dataA<<dataB;
        end        
        4'b0100:begin       //slt
            out = (dataA<dataB)?1:0;
        end    
        4'b0110:begin       //sltu
            out = (dataA<dataB)?1:0;
        end   
        4'b1000:begin       //xor 
            out = dataA^dataB;
        end          
        4'b1011:begin       //sra  
            out = dataA>>>dataB;
        end        
        4'b1010:begin       //srl 
            out = dataA>>dataB;
        end            
        4'b1100:begin       //or
            out = dataA|dataB;
        end          
        4'b1110:begin       //and
            out = dataA&dataB;
        end          
        default:begin
            out  =  dataA+dataB;
        end
    endcase
end

endmodule
