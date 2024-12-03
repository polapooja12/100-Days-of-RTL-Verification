`include "full_tran.sv"
`include "full_gen.sv"
`include "full_drv.sv"
`include "full_mon.sv"
`include "full_scrb.sv"
`include "full_inf.sv"
`include "full_env.sv"
module test_tb;
  add_inf inf();
  full_adder dut(.a(inf.a),.b(inf.b),.cin(inf.cin),.sum(inf.sum),.carry(inf.carry));
  environment env;
  initial begin
    env = new(inf);
    env.gen.n=10;
    env.run();
  end
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars;
      #100 $finish;
  end
endmodule