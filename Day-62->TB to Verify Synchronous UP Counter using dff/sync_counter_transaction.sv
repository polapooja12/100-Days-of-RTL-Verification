// sync_counter_transaction.sv
class sync_counter_transaction;
    bit [3:0] q; 
    bit [3:0] qbar; 

    // Print method to display the values of variables
    function void print(string name);
        $display("------- %0s -------", name);
        $display("The output q=%b", q);
        $display("The output qbar=%b", qbar);
    endfunction
endclass
