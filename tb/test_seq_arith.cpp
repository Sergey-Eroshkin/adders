#include <verilated.h>
#include <iostream>
#include "verilated_vcd_c.h"
#include "Vcalc.h"

using namespace std;

int main(int argc, char** argv){
	Verilated::commandArgs(argc, argv);
	Verilated::traceEverOn(true);
	Vcalc* dut = new Vcalc;
	VerilatedVcdC* tfp = new VerilatedVcdC;
	dut->trace(tfp, 99);
	tfp->open("waveform.vcd");
	
	dut->clk = 0;
	dut->A = 0;
	vluint64_t sim_time = 0;
	dut-> btn = 0xF;
	dut->eval();

	auto tick = [&] () {
		dut->clk = 0; dut->eval();
		tfp->dump(sim_time); sim_time += 10;
		dut->clk = 1; dut->eval();
		tfp->dump(sim_time); sim_time += 10;
		dut->clk = 0; dut->eval();
		tfp->dump(sim_time); sim_time += 10;
	};

	auto press = [&](int i){
		cout << "Button " << i << " is pressed:\n";
		dut->btn &= ~(1 << i);
		tick();
		dut->btn |= (1 << i);
		tick();
		printf("A = %d, LEDG = %d", dut->A, dut->S);
	};

	for(int i = 0; i < 5; i++){
		dut->A = i; tick();
		press(0);
		for(int j = 0; j <5; j++){
			dut->A = j; tick();
			press(1);
			press(2);
			press(3);
		}
	}
	tfp->dump(sim_time);
	tfp->close();
	delete tfp;
	delete dut;
	return 0;
}
