# 4-bit ALU in Verilog HDL

This project implements a 4-bit Arithmetic Logic Unit (ALU) using Verilog HDL.
An ALU is a fundamental digital building block used in processors to perform
arithmetic and logical operations.

## Project Overview
The ALU accepts two 4-bit inputs (A and B) and performs different arithmetic or
logical operations based on select control signals. The design is implemented
using a modular approach, where individual operations are generated separately
and an 8:1 multiplexer is used to select the final output.

This architecture improves readability, modularity, and scalability of the design.

## Operations Supported
- Addition
- Subtraction
- Increment A by 1
- Decrement A by 1
- AND
- OR
- XOR
- NOT

## Design Details
- 4-bit ALU implemented using an 8:1 multiplexer
- Separate multiplexer module (`mux8to1.v`) for clean and modular design
- RTL-style Verilog coding
- Block-level circuit diagram included for design clarity

## Test Conditions
All waveform results shown in this repository are verified using the fixed test case:
- A = 4'b0101
- B = 4'b0011

This input combination was chosen to clearly demonstrate the correctness of
all supported ALU operations in the simulation waveforms.

## Verification
- Fully verified using a self-written Verilog testbench (`alu_tb.v`)
- Operation-wise waveform screenshots are included for each ALU function
- Simulation results are organized for easy interpretation


## Tools Used
- Verilog HDL
- Vivado (Simulation)

## Notes
Vivado project files (`.xpr`) and waveform configuration files (`.wcfg`) are
tool-specific and are intentionally not included. Users can create a new
Vivado project and add the provided Verilog source and testbench files
to reproduce the simulation results.

## Project Structure
## Project Structure

```text
4_Bit_ALU/
│── alu.v
│── alu_tb.v
│── mux8to1.v
│── README.md
│
├── circuit/
│   └── circuit_diagram.png
│
└── Results/
    ├── truth_table_output.png
    └── simulation/
        ├── add.png
        ├── sub.png
        ├── and.png
        ├── or.png
        ├── xor.png
        ├── not_a.png
        ├── inc_a_by_1.png
        └── dec_a_by_1.png

## Author
Ritesh Kumar

