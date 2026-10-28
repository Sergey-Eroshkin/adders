module subtracter (
	input wire [3:0] A,
	input wire [3:0] B,
	output wire [3:0] S
);
	wire [3:0] tmp;
	summer s1 (
		.A(A[3:0]),
		.B(~B[3:0]),
		.S(tmp[3:0])
	);
	summer s2 (
		.A(tmp[3:0]),
		.B(4'b0001),
		.S(S[3:0])
	);

endmodule