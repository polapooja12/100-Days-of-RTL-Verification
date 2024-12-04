module decoder(input logic a, b, output logic y0, y1, y2, y3);
    assign y0 = ~a & ~b; // Output for 00
    assign y1 = ~a & b;  // Output for 01
    assign y2 = a & ~b;  // Output for 10
    assign y3 = a & b;   // Output for 11
endmodule
