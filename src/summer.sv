module summer(
	input wire [3:0] A,
	input wire [3:0] B,
	output wire [3:0] S
);
	wire tmp1, tmp2, tmp3, tmp4;
	one_bit_summer s0( .a(A[0]), .b(B[0]), .cin(1'b0), .c(S[0]), .cout(tmp1) );
	one_bit_summer s1( .a(A[1]), .b(B[1]), .cin(tmp1), .c(S[1]), .cout(tmp2) );
	one_bit_summer s2( .a(A[2]), .b(B[2]), .cin(tmp2), .c(S[2]), .cout(tmp3) );
	one_bit_summer s3( .a(A[3]), .b(B[3]), .cin(tmp3), .c(S[3]), .cout(tmp4) );

endmodule
