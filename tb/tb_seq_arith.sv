`timescale 1ns/1ps
module tb_seq_arith();
	logic clk;
	logic [3:0] KEY;
	logic [3:0] SW;
	logic [3:0] LEDG;
	calc dut( .clk(clk), .A(SW), .btn(KEY), .S(LEDG) );
	initial clk = 0;
	always #10 clk = ~clk;
	initial begin
		$monitor("time=%0t | A_reg=%0d B_reg=%0d | LEDG=%0d (%b)",
							$time, dut.A_reg, dut.B_reg, LEDG, LEDG);
	end

	
	initial begin
        SW      = 4'b0;
        KEY     = 4'b1111;
        #10;
		  
		  for(int i = 0; i < 15; i++) begin
			for(int j = 0; j < 15; j++) begin
				SW = i[3:0];
				#10;
				KEY[0] = 1'b0;
				#20;
				KEY[0] = 1'b1;
				#10;
				if (dut.A_reg !== i[3:0])
					$error("A_reg: expected %0d, got %0d", i, dut.A_reg);
				else
					$display("A_reg = %0d OK", dut.A_reg);

				SW = j[3:0];
				#10;		  
				KEY[1] = 1'b0;
				#20;
				KEY[1] = 1'b1;
				#10;
				if (dut.B_reg !== j[3:0])
					$error("B_reg: expected %0d, got %0d", j, dut.B_reg);
				else
					$display("B_reg = %0d OK", dut.B_reg);

				KEY[2] = 1'b0;
				#20;
				KEY[2] = 1'b1;		  
				#10;
				if (LEDG !== ((i + j) & 4'hF))
					$error("ADD: expected %0d, got %0d",((i + j) & 4'hF), LEDG);
				else
					$display("ADD result = %0d OK", LEDG);

				KEY[3] = 1'b0;
				#20;
				KEY[3] = 1'b1;		  
				#10;
				if (LEDG !== ((i - j) & 4'hF))
					$error("SUB: expected %0d, got %0d",((i - j) & 4'hF), LEDG);
				else
					$display("SUB result = %0d OK", LEDG);
			end
		end	
				/*

        // ---------- Тест 2: A = 3, B = 5 (отрицательная разность) ----------
        $display("\n--- Test 2: A=3, B=5 ---");

        SW = 4'd3;
        #10;
        press_btn(btn_a);
        #10;
        if (dut.A_reg !== 4'd3)
            $error("A_reg: expected 3, got %0d", dut.A_reg);
        else
            $display("A_reg = %0d OK", dut.A_reg);

        SW = 4'd5;
        #10;
        press_btn(btn_b);
        #10;
        if (dut.B_reg !== 4'd5)
            $error("B_reg: expected 5, got %0d", dut.B_reg);
        else
            $display("B_reg = %0d OK", dut.B_reg);

        press_btn(btn_add);
        #10;
        if (LEDG !== 4'd8)
            $error("ADD: expected 8, got %0d", LEDG);
        else
            $display("ADD result = %0d OK", LEDG);

        press_btn(btn_sub);
        #10;
        // 3 - 5 = -2, по модулю 16 = 14
        if (LEDG !== 4'd14)
            $error("SUB: expected 14, got %0d", LEDG);
        else
            $display("SUB result = %0d OK", LEDG);

        // ---------- Тест 3: граничные значения ----------
        $display("\n--- Test 3: A=15, B=0 ---");
        SW = 4'd15;
        #10;
        press_btn(btn_a);
        SW = 4'd0;
        #10;
        press_btn(btn_b);
        press_btn(btn_add);
        #10;
        if (LEDG !== 4'd15) $error("ADD: expected 15, got %0d", LEDG);
        else $display("ADD result = %0d OK", LEDG);

        press_btn(btn_sub);
        #10;
        if (LEDG !== 4'd15) $error("SUB: expected 15, got %0d", LEDG);
        else $display("SUB result = %0d OK", LEDG);
*/
        $display("\n=== All tests finished ===");
        $stop;
	end
	
endmodule
