class transaction;
  rand bit din;  // Data input
  bit dout;      // Data output
  bit rst;       // Reset signal

  function void print(string name);
    $display("------- %0s -------", name);
    $display("D Flip-Flop Input: din=%b, rst=%b", din, rst);
    $display("D Flip-Flop Output: dout=%b", dout);
  endfunction
endclass
