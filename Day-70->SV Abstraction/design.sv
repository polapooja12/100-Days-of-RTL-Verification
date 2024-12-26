virtual class packet;
  bit[3:0] addr;
  virtual function void display();
    $display("parent d.addr=%0d",addr);
  endfunction
endclass
class data extends packet;
  function void display();
    $display("parent d.addr=%0d,addr);
  endfunction
endclass
module top;
  packet p;
  data d;
  initial begin
    d=new();
    d.addr=12;
    $display("d.addr=%0d",d.addr);
    d.display();
  end
endmodule
