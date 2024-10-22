`include clock_divider.v"
module clock_divider_test;
  reg clk,reset;
  wire f4;
  clock_divider inst(clk,reset,f4);
  always #5 clk=~clk;
  initial begin
    clk=0;
    reset=1;
    #5
    reset=0;
    #500;
    $finish;
  end
endmodule
