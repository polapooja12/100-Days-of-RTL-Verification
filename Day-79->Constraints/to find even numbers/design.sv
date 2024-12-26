class packet;
  rand int data;
  constraint c1{data%2==0;}
  constraint c2{data inside{[0:20]};}
endclass
module top;
  packet p;
  initial begin
    p=new();
    repeat(20) begin
      p.randomize();
      $display("data=%0d",p.data);
    end
  end
endmodule
