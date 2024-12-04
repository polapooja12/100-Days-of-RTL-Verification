class transaction;
  rand bit a;  // Input a
  rand bit b;  // Input b
  rand bit c;  // Input c
  rand bit d;  // Input d
  bit y1;      // Output y1
  bit y2;      // Output y2

  function void print(string name);
    $display("------- %0s -------", name);
    $display("Inputs: a=%b, b=%b, c=%b, d=%b", a, b, c, d);
    $display("Outputs: y1=%b, y2=%b", y1, y2);
  endfunction
endclass
