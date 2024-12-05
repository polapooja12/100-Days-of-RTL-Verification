module mux4to1(
    input logic a,b,c,d, // 4 data inputs
    input logic s1,s2,  // 2-bit select input
    output logic y        // Output
);
    assign y = (~s1 & ~s2 & a) | (~s1 & s2 & b) | (s1 & ~s2 & c) | (s1 & s2 & d);

endmodule
