class packet;
  rand bit[2:0] num;
  rand bit[7:0] sqaure;
  constraint c2{num inside{[0:100]};}
  constraint c1{square=num**2;}
endclass
module top;
  packet p;
  p=new();
  initial begin
    p.randomize();
    $display("number=%0d",p.num);
    $display("sqaure of the number=%0d",p.sqaure);
  end
  end
endmodule
