/* For a given set if fixed arrays, perform the following.
a)Reverse the order of the elements given below.
b)sort them in ascending order.
c)sort them in descending order.
d) Shuffle the elements.
Perform the above using inbuilt methods. */
module dynamic_array;
  int array[9:0]='3,8,2,1,4,6,0,9,6,7};
  initial begin
    $display("fixed array=%p",array);
    array.reverse();
    $display("reverse order=%p",array);
    array.sort();
    $display("sorted in ascending ordered array=%p",array);
    array.reverse();
    $display("sorted in descending ordered array=%p",array);
    array.shuffle();
    $display("shuffled array=%p",array);
  end
endmodule
