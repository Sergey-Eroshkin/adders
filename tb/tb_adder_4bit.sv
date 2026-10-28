`timescale 1ns/1ps
module tb_adder_4bit();
	logic [3:0] res, a, b;
	summer dut(.A(a), .B(b), .S(res));
	initial begin
		for(int i = 0; i < 16; i++) begin
			for(int j = 0; j < 16; j++) begin
				a = i[3:0];
				b = j[3:0];	
				#10;
				if(res != ((a + b) & 4'hF)) $error("At time = %0t Error match: got %h, expected %h", $time, res, ((a + b) & 4'hF));
			end
		end
		$display("Time = %0t   ==END==", $time);
		$finish;
	end
endmodule