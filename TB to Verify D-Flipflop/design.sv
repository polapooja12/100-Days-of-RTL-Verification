module dff (dff_if vif);
  always @(posedge vif.clk) begin
    if (vif.rst == 1'b1)
      vif.dout <= 1'b0; // Reset the output
    else
      vif.dout <= vif.din; // Update output with input
  end
endmodule
