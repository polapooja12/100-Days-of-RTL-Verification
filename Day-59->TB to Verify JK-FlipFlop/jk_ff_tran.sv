class transaction;
    rand bit j;  // J input
    rand bit k;  // K input
    bit reset;   // Reset signal
    bit q;       // Q output
    bit qn;      // Complementary Q output

    function void print(string name);
        $display("------- %0s -------", name);
        $display("Inputs: j=%b, k=%b, reset=%b", j, k, reset);
        $display("Outputs: q=%b, qn=%b", q, qn);
    endfunction
endclass
