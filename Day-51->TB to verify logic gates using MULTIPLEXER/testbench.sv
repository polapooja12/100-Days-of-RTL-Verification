`include "logicgates_inf.sv"
`include "logicgates_env.sv"

module test_tb;
  logicgates_inf inf();
  logicgates_using_mux dut(.a(inf.a), .b(inf.b), .y1(inf.y1), .y2(inf.y2), .y3(inf.y3), .y4(inf.y4), .y5(inf.y5), .y6(inf.y6));
  environment env;
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
