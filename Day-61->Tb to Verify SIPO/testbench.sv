// sipo_testbench.sv
//`include "sipo_design.sv"
`include "sipo_interface.sv"
`include "sipo_environment.sv"

module sipo_testbench;

    // Instantiate the interface
    sipo_inf inf();

    // Instantiate the DUT
    sipo_reg dut(.clk(inf.clk), .d(inf.d), .q(inf.q));

    // Instantiate the environment
    sipo_environment env;

    initial begin
        // Initialize the environment with the interface
        env = new(inf);

        // Set the number of transactions
        env.gen.n = 10;

        // Run the test
        env.run();
    end

    // Clock generation
    initial begin
        inf.clk = 0;
        forever #5 inf.clk = ~inf.clk; // Toggle clock every 5 time units
    end

    // Dump waveforms
    initial begin
        $dumpfile("sipo_dump.vcd");
        $dumpvars(0, sipo_testbench);
        #200 $finish; // End simulation after sufficient time
    end

endmodule
