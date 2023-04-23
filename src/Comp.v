module comp(a,b,eq,lt);
    input wire[31:0] a,b;
    output wire eq,lt;
    
    assign eq = (a==b);
    assign lt = (a<b);
endmodule