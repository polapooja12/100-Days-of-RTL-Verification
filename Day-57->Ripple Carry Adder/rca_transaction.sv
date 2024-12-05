class transaction;
    rand bit [3:0] a, b;
    rand bit cin;
    bit [3:0] sum;
    bit carryout;

    function void print(string name);
        $display("------- %0s -------", name);
        $display("a = %b, b = %b, cin = %b", a, b, cin);
        $display("sum = %b, carryout = %b", sum, carryout);
    endfunction
endclass
