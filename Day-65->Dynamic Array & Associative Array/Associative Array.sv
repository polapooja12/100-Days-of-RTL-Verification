module asso_array();
  int a_arr[int];
  initial begin
    a_arr[0]=0;
    a_arr[100]=100;
    a_arr[20]=20;
    a_arr[50]=50;
    a_arr[40]=40;
    a_arr[10]=10;
    foreach(a_arr[i])
      $display("The associative a_arr[%0d] is %d",i,a_arr[i]);
  end
endmodule
