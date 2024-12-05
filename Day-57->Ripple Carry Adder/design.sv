module fa(a, b, c, sum, carry);
    input a, b, c;
    output reg sum, carry;

    always @(*) begin
        sum = a ^ b ^ c;
        carry = (a & b) | (b & c) | (c & a);
    end
endmodule

module ripple_carry_adder(a, b, cin, sum, carryout);
    input [3:0] a, b;
    input cin;
    output reg [3:0] sum;
    output reg carryout;

    wire [2:0] carry;

    fa d1(.a(a[0]), .b(b[0]), .c(cin), .sum(sum[0]), .carry(carry[0]));
    fa d2(.a(a[1]), .b(b[1]), .c(carry[0]), .sum(sum[1]), .carry(carry[1]));
    fa d3(.a(a[2]), .b(b[2]), .c(carry[1]), .sum(sum[2]), .carry(carry[2]));
    fa d4(.a(a[3]), .b(b[3]), .c(carry[2]), .sum(sum[3]), .carry(carryout));
endmodule
