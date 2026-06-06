\# Universal Shift Register (4-bit) – Verilog



This project implements a \*\*4-bit Universal Shift Register (USR)\*\* using \*\*Verilog HDL\*\*.

The design is created using a \*\*modular bit-slice architecture\*\*, where each bit is built

using a \*\*4:1 multiplexer and a D flip-flop\*\*.



The Universal Shift Register can perform multiple operations such as holding data,

shifting left, shifting right, and parallel loading, based on select control signals.



\## Features

\- Hold

\- Shift Right

\- Shift Left

\- Parallel Load



\## Block-Level Architecture



Each bit of the register consists of:

\- \*\*One 4:1 Multiplexer\*\*: selects the input data based on control signals

\- \*\*One D Flip-Flop\*\*: stores the selected data on the rising edge of the clock



Four identical bit-slices are connected together to form a \*\*4-bit Universal Shift Register\*\*.



\## Role of the 4:1 Multiplexer



The \*\*4:1 multiplexer\*\* is the core decision-making element in each bit-slice.



For each bit, the multiplexer selects one of the following inputs:

\- \*\*Hold input\*\* → feedback from the same bit output

\- \*\*Shift-right input\*\* → data from the next higher bit or external serial input

\- \*\*Shift-left input\*\* → data from the next lower bit or external serial input

\- \*\*Parallel input\*\* → corresponding bit from parallel data input



The selected output of the multiplexer is fed into the \*\*D input of the flip-flop\*\*.



\## Shift Direction Definition



\- \*\*Shift Right\*\*:  

&nbsp; New data enters at the \*\*Most Significant Bit (MSB)\*\* and shifts toward the \*\*Least Significant Bit (LSB)\*\*.



\- \*\*Shift Left\*\*:  

&nbsp; New data enters at the \*\*Least Significant Bit (LSB)\*\* and shifts toward the \*\*Most Significant Bit (MSB)\*\*.



\## Tools Used

\- Verilog HDL

\- Xilinx Vivado



\## Author

Ritesh Kumar



