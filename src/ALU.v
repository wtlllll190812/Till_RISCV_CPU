module ALU(ra,rb,sel,out);
input ra,rb,sel;
output out;

wire signed[31:0] ra,rb;
reg signed[31:0] out;
wire [3:0] sel;

always @(*) begin
    case(sel)
        4'b0001:begin out=ra-rb;end         //sub
        4'b0000:begin out=ra+rb;end         //add
        4'b0010:begin out=ra<<rb;end         //sll
        4'b0100:begin out=(ra<rb)?1:0;end    //slt
        4'b0110:begin out=(ra<rb)?1:0;end    //sltu
        4'b1000:begin out=ra^rb;end          //xor
        4'b1011:begin out=ra>>>rb;end       //sra   
        4'b1010:begin out=ra>>rb;end        //srl     
        4'b1100:begin out=ra|rb;end          //or
        4'b1110:begin out=ra&rb;end          //and
        default:begin
            out = ra+rb;
        end
    endcase
end

endmodule
