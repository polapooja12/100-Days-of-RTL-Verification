`include "dff_if.sv"
`include "dff_env.sv"

module test_tb;
  dff_if inf();

  dff dut(.vif(inf));

  environment env;
  initial begin
    inf.clk = 0;
    inf.rst = 1'b1; // Start with reset active
    inf.din = 1'b0; // Default input value
    inf.dout = 1'b0; // Default output value
    #10 inf.rst = 1'b0; // Release reset after 10 time units
end


initial begin
    inf.clk = 0; 
    forever #5 inf.clk = ~inf.clk; // Clock with a period of 10 time units
end
  initial begin
    env = new(inf);
    env.gen.n = 10; 
    env.run();
  end
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;

    #100 $finish;
  end
endmodule
