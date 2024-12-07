module d_sipo_reg(output reg q = 1'b0, input wire clk, d);
    always @(posedge clk) begin
        q <= d;
    end
endmodule

module sipo_reg(output reg [3:0] q, input wire clk, d);
    d_sipo_reg ml(q[0], clk, d);
    d_sipo_reg m2(q[1], clk, q[0]);
    d_sipo_reg m3(q[2], clk, q[1]);
    d_sipo_reg m4(q[3], clk, q[2]);
endmodule
