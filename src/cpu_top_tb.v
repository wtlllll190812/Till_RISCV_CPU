`timescale 1ns / 1ps
module cpu_top_tb;
reg clk=1;
always #100 clk = ~clk;     // 5MHz
cpu_top cpu_inst(.clk(clk));
initial begin
    #500 $stop;
end
endmodule