module fibonacci_series(input wire[31:0]n, output reg[31:0]result);
  function automatic [31:0] fib;
    inpu[31:0] x;
    begin
      if (x==0) fib=0;
      else if (x<=2) fib=1;
      else fib=fib(x-1)+fib(x-2);
    end
  endfunction
  always @(*) begin
    result=fib(n);
  end
endmodule
