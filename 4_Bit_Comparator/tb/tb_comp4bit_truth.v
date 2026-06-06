`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2025 13:16:47
// Design Name: 
// Module Name: tb_comp4bit_truth
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








module tb_comparator_truthtable;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;

    // Outputs
    wire A_gt_B;
    wire A_lt_B;
    wire A_eq_B;

    // Loop variables
    integer i, j;

    // Instantiate the 4-bit Comparator (Unit Under Test)
    comparator_4bit uut (
        .A(A), 
        .B(B), 
        .A_gt_B(A_gt_B), 
        .A_lt_B(A_lt_B), 
        .A_eq_B(A_eq_B)
    );

    initial begin
        // 1. Print the Table Header
        $display("-------------------------------------------------------------------------");
        $display("|   A (Dec)  |   B (Dec)  |  A (Bin)  |  B (Bin)  |  A>B  |  A<B  |  A=B  |");
        $display("-------------------------------------------------------------------------");

        // 2. Loop through all 256 combinations (0 to 15 for A, 0 to 15 for B)
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                
                // Apply Inputs
                A = i;
                B = j;

                // Wait for inputs to propagate through the logic
                #10;

                // 3. Print the Truth Table Row
                // %2d ensures decimal numbers take up 2 spaces (e.g., " 5" vs "15")
                // %b prints the binary representation
                $display("|     %2d     |     %2d     |    %b   |    %b   |   %b   |   %b   |   %b   |", 
                         A, B, A, B, A_gt_B, A_lt_B, A_eq_B);
            end
        end
        
        $display("-------------------------------------------------------------------------");
        $display("Truth Table Generation Complete.");
        $finish;
    end

endmodule

