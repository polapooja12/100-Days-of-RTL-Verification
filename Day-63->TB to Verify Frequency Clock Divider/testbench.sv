//`include "clock_divider_design.sv"
`include "clock_divider_interface.sv"
`include "clock_divider_environment.sv"

module clock_divider_testbench;
    // Declare the virtual interface
    clock_divider_inf inf();

    // Instantiate the DUT
    clock_divider dut(
        .clk(inf.clk), 
        .f2(inf.f2), 
        .f4(inf.f4), 
        .f8(inf.f8), 
        .f16(inf.f16), 
        .f32(inf.f32), 
        .f64(inf.f64)
    );

    // Instantiate the testbench environment
    clock_divider_environment env;

    // Clock generation
    initial begin
        inf.clk = 0; 
        forever #5 inf.clk = ~inf.clk; // Clock with a period of 10 time units
    end

    // Initialize environment and run test
    initial begin
        env = new(inf);
        env.gen.n = 20; // Number of transactions
        env.run();
    end

    // VCD dump for waveform analysis
    initial begin
        $dumpfile("dump.vcd"); 
        $dumpvars(0, clock_divider_testbench);
      
        #500 $finish; // Run for 500 time units
    end
endmodule
