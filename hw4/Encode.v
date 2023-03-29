module Encode (
    D,x,y,V
);
input  wire[3:0] D;
output reg x,y,V;

always @(D) begin
    x=D[2]||D[3];
    y=(~D[2])&&D[1]||D[3];
    V=D[0]||D[1]||D[2]||D[3];
end

endmodule //Encode