`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2025 13:14:32
// Design Name: 
// Module Name: mux4to1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// 4:1 multiplexer (1-bit)
// select is {s1, s0} where s1 = MSB, s0 = LSB
module mux_4to1 (
    input [3:0] I,  // Data Inputs: {I3, I2, I1, I0}
    input [1:0] S,  // Select Lines: {S1, S0} which will be {A, B}
    output Y        // Output
);
    assign Y = I[S];
endmodule

