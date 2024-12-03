class transaction;
    rand bit a, b, bin;
    bit diff;
    bit bout;

    function void print(string name);
        $display("------- %0s -------", name);
        $display("The values of a=%b, b=%b, and bin=%b", a, b, bin);
        $display("The diff=%b and bout=%b", diff, bout);
    endfunction
endclass
