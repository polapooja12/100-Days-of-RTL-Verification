//`include "sync_counter_design.sv"
`include "sync_counter_interface.sv"
`include "sync_counter_environment.sv"

module sync_counter_testbench;
    // Declare the virtual interface
    sync_counter_inf inf();

    // Instantiate the DUT
    d_sync_counter dut(.clk(inf.clk), .q(inf.q), .qbar(inf.qbar));

    // Instantiate the testbench environment
    sync_counter_environment env;

    // Clock generation
    initial begin
        inf.clk = 0; 
        forever #5 inf.clk = ~inf.clk; // Clock with a period of 10 time units
    end

    // Run the testbench environment
    initial begin
        env = new(inf); 
        env.gen.n = 10; // Number of transactions
        env.run();
    end

    // VCD dump for waveform analysis
    initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars(0, sync_counter_testbench);
    #500 $finish; // Extended simulation time to 500 time units
end

endmodule
