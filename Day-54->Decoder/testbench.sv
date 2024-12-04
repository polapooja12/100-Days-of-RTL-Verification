`include "decoder_inf.sv"    // Include the interface
`include "decoder_env.sv" 


module testbench; // Testbench module
    decoder_inf inf(); // Instantiate the interface

    // Instantiate the DUT (Device Under Test)
    decoder dut(
        .a(inf.a), 
        .b(inf.b), 
        .y0(inf.y0), 
        .y1(inf.y1), 
        .y2(inf.y2), 
        .y3(inf.y3)
    );

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
