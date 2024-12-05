//`include "ripple_carry_adder.sv"
`include "rca_interface.sv"
`include "rca_environment.sv"
module ripple_carry_adder_tb;
    rca_interface inf();
    ripple_carry_adder dut(
        .a(inf.a),
        .b(inf.b),
        .cin(inf.cin),
        .sum(inf.sum),
        .carryout(inf.carryout)
    );
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
