`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2026 16:38:25
// Design Name: 
// Module Name: bit
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


module bit(
    input clk,
    input rst,
    input [1:0]s,
    input hold_in,
    input s_r_in,
    input s_l_in,
    input p_in,
    output q
    );
    wire d;
    mux4to1 m1(.i({p_in, s_l_in, s_r_in, hold_in}),.s(s),.y(d));
    dff d1(.d(d),.clk(clk),.rst(rst),.q (q));
endmodule
