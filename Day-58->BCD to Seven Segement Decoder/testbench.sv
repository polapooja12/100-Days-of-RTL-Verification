// Including file such as design, interface, environment
//`include "BCDto7Segment.sv"
`include "BCDto7Segment_inf.sv"
`include "BCDto7Segment_env.sv"

module test_tb;
  BCDto7Segment_inf inf();

  BCDto7Segment dut(.bcd(inf.bcd), .seg(inf.seg));

  environment env;

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
