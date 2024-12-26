/* Create an enum example which uses all the inbuilt methods available first(),last(),prev(),next(),num(),name(),and display all the methods. */
module example;
  typedef enum{green=10,yellow=5,red=20,pink=15,blue=50,white=80}color_e;
  color_e color;
  int sum;
  initial begin 
    $display("first index of the enum is %0d and Name=%0s",color.first(),color.first.name());
    $display("last index of the enum is %0d and Name=%0s",color.last(),color.last.name());
    color=blue;
    $display("prev element of blue is %0d and Name=%0s",color.prev(),color.prev.name());
    $display("next element of blue is %0d and Name=%0s",color.next(),color.next.name());
    $display("total enum number=%0d",color.num());
    $displa("next element of blue is %0s",color.name());
    color=green;
    repeat(6) begin
      sum=sum+color;
      color=color.next();
    end
    $display("sum is%0d",sum);
  end
endmodule

    
    
