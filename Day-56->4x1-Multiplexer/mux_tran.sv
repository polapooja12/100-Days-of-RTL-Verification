class transaction; // Class for transaction
    rand logic a, b, c, d;   // 4 data inputs
    rand logic s1, s2;       // 2-bit select input
    logic y;                // Output

    // Print method to display values
    function void print(string name);
        $display("------- %0s -------", name);
        $display("A: %b, B: %b, C: %b, D: %b, S1: %b, S2: %b, Y: %b", a, b, c, d, s1, s2, y);
    endfunction
endclass
