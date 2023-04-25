module Comp(
    input wire[31:0] dataA,dataB,
    output wire eq,lt
);

begin
    assign eq = (dataA==dataB);
    assign lt = (dataA<dataB);
end

endmodule