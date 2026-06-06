# 4-bit Comparator in Verilog HDL

This project implements a 4-bit digital comparator using Verilog HDL.
The comparator compares two 4-bit inputs and determines whether one number
is greater than, equal to, or less than the other.

## Project Overview
This project implements a 4-bit digital comparator using Verilog HDL.
The comparison is performed in a **bit-by-bit hierarchical manner**, starting
from the most significant bit (MSB) to the least significant bit (LSB).

A **1-bit comparator** is first designed, which compares individual bits of the
inputs. The outputs of these 1-bit comparators are then combined to form the
final 4-bit comparator.

## Design Methodology
- Comparison is done **bit by bit**, beginning from the MSB
- A 1-bit comparator** is used as the basic building block
- A **4:1 multiplexer** is used to select the appropriate comparison result
  (greater than, equal to, or less than) based on the comparison logic
- The design is fully **combinational** and modular

This hierarchical approach improves clarity, scalability, and reuse of logic,
making it suitable for digital and VLSI design applications.

## Outputs
- `gt` : High when A > B
- `eq` : High when A = B
- `lt` : High when A < B

## Design Details
- Pure combinational logic design
- Modular RTL implementation
- Uses a multiplexer-based selection approach

## Verification
- Verified using a Verilog testbench
- Simulation waveforms included for all comparison cases
- Truth table outputs included

## Tools Used
- Verilog HDL
- Xilinx Vivado (Simulation)

## Author
Ritesh Kumar
