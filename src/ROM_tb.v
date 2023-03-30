module Rom_tb;
wire[31:0] data;
reg[31:0] addr;
wire en=1;

Rom Rom_inst(.addr(addr),.data(data),.en(en));
initial begin
    #100 addr=32'd0;
    #100 addr=32'd1;
    #100 addr=32'd2;
    #100 addr=32'd3;
    #100 $stop;
end
endmodule