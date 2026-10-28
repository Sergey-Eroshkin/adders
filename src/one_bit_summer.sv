module one_bit_summer(
	input logic a,
	input logic b,
	input logic cin,
	output logic c,
	output logic cout
);
	assign cout = a & b | a & cin | b & cin;
	assign c = a ^ b ^ cin;
endmodule
