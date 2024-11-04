`include "design.v"
module testbench(clk, rst, start, filled, doorclose, doorlock, detergent, cycletime_out, drained, spintime_out, fillvalve_on, soap_w ash, motor_on, drainvalve_on, water_wash, done);
output reg clk, rst, doorclose, start, filled, detergent, cycletime_out, drained, spintime_out; 
input wire doorlock, motor_on, fillvalve on, drainvalve_on, soapwash, water_wash, done;
  washingmachine inst(clk, rst, start, filled, doorclose, doorlock, detergent, cycletime_out, drained, spintime_out, fillvalve_on, soap_wash, washmotor motor on, drainvalve on, water wash, done);
  always #5 clk=-clk;
  initial begin
    $monitor("Time=%od clk=%0b rst=%0b start=%0b doorclose=%0b,filled=%Ob detergent=%0b cycletime_out=%0b spintime_out=%0b doorlock=%ob fillvalve_on=%0b drainvalve_on=%eb soap wash=%ob water washob done=%0b", $time, clk, rst, start, doorclose, fi lled, detergent, cycletime_out, spintime out, doorlock, fillvalve on, drainvalve on, soap wash, water wash, done);
    clk=0;
    rst=1;
    start=0;
    doorclose=0;
    filled=0;
    drained=0;
    detergent=0;
    cycletime_out=0;
    spintime_out=0;
    #5 rst=0;
    #5 start=1; doorclose=1;
    #10 filled=1;
    #10 detergent=1;
    #10 cycletime out=1;
    #10 drained=1;
    #10 spintime out=1;
    #50
    $finish;
  end
endmodule
