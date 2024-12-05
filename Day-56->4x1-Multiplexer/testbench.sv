//`include "design.sv"
`include "full_inf.sv"
`include "full_env.sv"
module testbench; // Testbench module
    full_inf inf(); // Instantiate the interface
    mux4to1 dut(.a(inf.a), .b(inf.b), .c(inf.c), .d(inf.d), .s1(inf.s1), .s2(inf.s2), .y(inf.y)); // Instantiate the DUT
    environment env; // Environment instance
    initial begin
        env = new(inf); // Create environment with the interface
        env.gen.n = 10; // Set number of transactions
        env.run(); // Start the environment
    end
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
        #100 $finish; // Finish simulation after 100 time units
    end
endmodule
