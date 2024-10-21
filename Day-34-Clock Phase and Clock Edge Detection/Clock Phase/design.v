module clock_phase(input clk,rst, output clk_0,clk_90,clk_180,clk_270);
  reg[1:0] count;
  reg div_2;
  always @(posedge clk or posedge rst) begin
    if(rst)
      count<=0;
    else
      count<={~count[0],count[1]};
  end
  always @(posedge clk or posedge rst) begin
    if(rst)
      div_2<=0;
    else
      div_2<=~div_2;
  end
  assign clk_0=count[1];
  assign clk_90=count[1]^div_2;
  assign clk_180=~clk[1];
  assign clk_270=~clk_90;
endmodule
