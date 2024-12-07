// sipo_transaction.sv
class sipo_transaction;
    rand bit d; 
    bit [3:0] q; 

    // Print method to display the values of variables
    function void print(string name);
        $display("------- %0s -------", name);
        $display("The input d=%b", d);
        $display("The output q=%b", q);
    endfunction
endclass
