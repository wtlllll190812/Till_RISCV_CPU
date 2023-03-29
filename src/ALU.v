module ALU(ra,rb,en,op,func7,out);
input ra,rb,op,en,func7;
output out;

wire signed[31:0] ra,rb;
reg signed[31:0] out;

wire en,func7;
wire [2:0] op;

always @(op or ra or rb or func7 or en) begin
    if(en)begin
        case(op)
            3'b000:begin 
                if(func7)
                    out=ra-rb;                  //sub
                else
                    out=ra+rb;                  //add
            end          
            3'b001:begin out=ra<<rb;end         //sll
            3'b010:begin out=(ra<rb)?1:0;end    //slt
            3'b011:begin out=(ra<rb)?1:0;end    //sltu
            3'b100:begin out=ra^rb;end          //xor
            3'b101:begin
                if(func7)     
                    out=ra>>>rb;                //sra
                else
                    out=ra>>rb;                 //srl
                end         
            3'b110:begin out=ra|rb;end          //or
            3'b111:begin out=ra&rb;end          //and
            default:begin
                out = ra+rb;
            end
        endcase
    end 
end

endmodule
