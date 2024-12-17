class clock_divider_transaction;
    bit f2, f4, f8, f16, f32, f64;

    // Print method to display transaction details
    function void print(string name);
        $display("----- %0s -----", name);
        $display("f2=%b f4=%b f8=%b f16=%b f32=%b f64=%b", f2, f4, f8, f16, f32, f64);
    endfunction
endclass
