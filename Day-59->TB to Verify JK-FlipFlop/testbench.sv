// Including file such as design, interface, environment
//`include "jk_flipflop.sv"
`include "jk_ff_if.sv"
`include "jk_ff_env.sv"

module test_tb;
    jk_ff_if inf();

    jk_ff dut(.clk(inf.clk), .reset(inf.reset), .j(inf.j), .k(inf.k), .q(inf.q), .qn(inf.qn));

    environment env;
  initial begin
    inf.reset = 1'b1;  // Assert reset
    inf.j = 1'b0;
    inf.k = 1'b0;

    #15; // Hold reset for a few clock cycles
    inf.reset = 1'b0;  // Deassert reset
end

    initial begin
    inf.clk = 0; 
    forever #5 inf.clk = ~inf.clk; // Clock with a period of 10 time units
    end
    initial begin
        env = new(inf);
        env.gen.n = 10;  // Set the number of transactions
        env.run();
    end
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
        #100 $finish;
    end
endmodule
