module adder (
	input logic [3:0] A,
	input logic [3:0] B,
	input logic sel,
	output logic [3:0] S
);

	logic [3:0] sum;
	logic [3:0] sub;
	
	summer add1(
		.A(A),
		.B(B),
		.S(sum)
	);

	subtracter sub1(
		.A(A),
		.B(B),
		.S(sub)
	);
	
	assign S = sel ? sub : sum;

endmodule