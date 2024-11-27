class transaction;
  rand bit a, b;
  bit y1, y2, y3, y4, y5, y6;

  function void print(string name);
    $display("------- %0s -------", name);
    $display("The values of a=%b and b=%b", a, b);
    $display("Outputs: y1=%b, y2=%b, y3=%b, y4=%b, y5=%b, y6=%b", y1, y2, y3, y4, y5, y6);
  endfunction
endclass
