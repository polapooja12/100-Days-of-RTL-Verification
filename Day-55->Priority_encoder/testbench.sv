`include "priority_encoder_if.sv"
`include "priority_encoder_env.sv"

module test_tb;
  priority_encoder_if inf();

  priority_encoder dut(.a(inf.a), .b(inf.b), .c(inf.c), .d(inf.d), .y1(inf.y1), .y2(inf.y2));

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
