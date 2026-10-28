cmake_minimum_required(VERSION 3.20)
project(hardware_verification)
find_package(verilator REQUIRED)


add_executable(testbench tb/testbench.cpp)


verilate(testbench
    SOURCES src/calc.sv src/one_bit_summer.sv src/summer.sv src/subtracter.sv
    TRACE
)
