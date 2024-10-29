`include "fibonacci_series.v"
module fibonacci_series_test;
  reg [31:0] n;
  wire [31:0] result;
  integer x;
  fibonacci_series inst(n,result);
  always for(x=0;x<=15;x=x+1)
    #10 n=x;
  initial begin
    $monitor("Time=%0t n=%0d result=%0d",$time,n,result);
    #160;
    $finish;
  end
endmodule
