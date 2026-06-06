`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2025 13:15:03
// Design Name: 
// Module Name: comp1bit
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


// 1-bit comparator stage implemented using three 4:1 muxes
// Inputs: Ai, Bi (bits to compare)
// GT_prev, EQ_prev, LT_prev: comparison result from more significant bits
// Outputs: GT_out, EQ_out, LT_out: updated comparison result
module comp_1bit_slice (
    input A, B,             // Current bits to compare
    input G_in, L_in, E_in, // Inputs from lower bit stage
    output G_out, L_out, E_out // Outputs to higher bit stage
);

    // MUX for "Greater Than" Output
    // I[3](11): G_in, I[2](10): 1, I[1](01): 0, I[0](00): G_in
    mux_4to1 mux_g (
        .I({G_in, 1'b1, 1'b0, G_in}), 
        .S({A, B}), 
        .Y(G_out)
    );

    // MUX for "Less Than" Output
    // I[3](11): L_in, I[2](10): 0, I[1](01): 1, I[0](00): L_in
    mux_4to1 mux_l (
        .I({L_in, 1'b0, 1'b1, L_in}), 
        .S({A, B}), 
        .Y(L_out)
    );

    // MUX for "Equal" Output
    // I[3](11): E_in, I[2](10): 0, I[1](01): 0, I[0](00): E_in
    mux_4to1 mux_e (
        .I({E_in, 1'b0, 1'b0, E_in}), 
        .S({A, B}), 
        .Y(E_out)
    );

endmodule
