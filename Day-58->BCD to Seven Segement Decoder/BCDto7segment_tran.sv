class transaction;
  rand bit [3:0] bcd;  // BCD input
  bit [6:0] seg;       // 7-segment output

  function void print(string name);
    $display("------- %0s -------", name);
    $display("BCD Input: bcd=%b", bcd);
    $display("7-Segment Output: seg=%b", seg);
  endfunction
endclass
