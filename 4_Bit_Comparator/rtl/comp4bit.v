`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2025 13:15:35
// Design Name: 
// Module Name: comp4bit
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

// 4-bit comparator composed of 4 comp1bit stages
module comparator_4bit (
    input [3:0] A,
    input [3:0] B,
    output A_gt_B, // A is Greater than B
    output A_lt_B, // A is Less than B
    output A_eq_B  // A is Equal to B
);
    // Internal wires to connect stages
    wire [3:0] g_net, l_net, e_net;
    // --- STAGE 0 (LSB) ---
    // Previous inputs are grounded for G/L, and VDD for E (Assume Equal initially)
    comp_1bit_slice slice0 (
        .A(A[0]), .B(B[0]), 
        .G_in(1'b0), .L_in(1'b0), .E_in(1'b1), 
        .G_out(g_net[0]), .L_out(l_net[0]), .E_out(e_net[0])
    );
    // --- STAGE 1 ---
    comp_1bit_slice slice1 (
        .A(A[1]), .B(B[1]), 
        .G_in(g_net[0]), .L_in(l_net[0]), .E_in(e_net[0]), 
        .G_out(g_net[1]), .L_out(l_net[1]), .E_out(e_net[1])
    );
    // --- STAGE 2 ---
    comp_1bit_slice slice2 (
        .A(A[2]), .B(B[2]), 
        .G_in(g_net[1]), .L_in(l_net[1]), .E_in(e_net[1]), 
        .G_out(g_net[2]), .L_out(l_net[2]), .E_out(e_net[2])
    );
    // --- STAGE 3 (MSB) ---
    comp_1bit_slice slice3 (
        .A(A[3]), .B(B[3]), 
        .G_in(g_net[2]), .L_in(l_net[2]), .E_in(e_net[2]), 
        .G_out(g_net[3]), .L_out(l_net[3]), .E_out(e_net[3])
    );
    // Assign final outputs from MSB stage
    assign A_gt_B = g_net[3];
    assign A_lt_B = l_net[3];
    assign A_eq_B = e_net[3];
    
endmodule

