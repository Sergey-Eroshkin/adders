module calc(
	input  logic 		 clk,
	input  logic [3:0] A,
	input  logic [3:0] btn,
	output logic [3:0] S
);

	logic [3:0] A_reg = 4'b0;
	logic [3:0] B_reg = 4'b0;
	logic [3:0] sum;
	logic [3:0] sub;
	summer s1(
		.A(A_reg),
		.B(B_reg),
		.S(sum)
	);
	
	subtracter s2(
		.A(A_reg),
		.B(B_reg),
		.S(sub)
	);
	always @(posedge clk) begin
		if(~btn[0]) A_reg <= A;
		if(~btn[1]) B_reg <= A;
		if(~btn[2]) S <= sum;
		else if(~btn[3]) S <= sub;
	end

endmodule
