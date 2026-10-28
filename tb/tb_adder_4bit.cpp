#include <verilated.h>
#include <iostream>
#include "Vsummer.h"

using namespace std;

int main(){
	Vsummer* dut = new Vsummer;
	int errors = 0;
	for(int i = 0; i < 16; i++){
		for(int j = 0; j < 16; j++){
			dut->A = i;
			dut->B = j;
			dut->eval();
			if((int)dut->S != int((i + j) & (0xF))){
				cout << "ERROR: " << int((i + j) & (0xF))
				     << " expected, " << (int)dut->S << " found\n";
				errors++;
			}
		}
	}
	if(errors) cout << "SUMMER: " << errors << " ERRORS\n";
	else cout << "SUMMER: ALL TESTS PASSED!\n";
	delete dut;
	return 0;
}
