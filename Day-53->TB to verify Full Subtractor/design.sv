module full_subtractor(input logic a, b, bin, output logic diff, bout);
   assign diff = a ^ b ^ bin;
assign bout = (~a & b) | (~a & bin) | (b & bin);
  
  //assign {bout, diff} = a - b - bin;
endmodule
