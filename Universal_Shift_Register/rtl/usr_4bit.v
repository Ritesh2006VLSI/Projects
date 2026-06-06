`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2026 16:49:16
// Design Name: 
// Module Name: usr_4bit
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


module usr_4bit(
    input clk,
    input rst,
    input [1:0]s,
    input s_r_in,
    input s_l_in,
    input [3:0]p_in,
    output wire [3:0]q
    );
    bit b0(.clk(clk),.rst(rst),.s(s),.hold_in(q[0]),.s_r_in(q[1]),.s_l_in(s_l_in),.p_in(p_in[0]),.q(q[0]));
    bit b1(.clk(clk),.rst(rst),.s(s),.hold_in(q[1]),.s_r_in(q[2]),.s_l_in(q[0]),.p_in(p_in[1]),.q(q[1]));
    bit b2(.clk(clk),.rst(rst),.s(s),.hold_in(q[2]),.s_r_in(q[3]),.s_l_in(q[1]),.p_in(p_in[2]),.q(q[2]));
    bit b3(.clk(clk),.rst(rst),.s(s),.hold_in(q[3]),.s_r_in(s_r_in),.s_l_in(q[2]),.p_in(p_in[3]),.q(q[3]));
endmodule
