`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2025 10:32:50
// Design Name: 
// Module Name: simulate_alu
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


module simulate_alu(

    );
    reg [3:0] a , b ;
    reg [2:0] opcode ;
    wire [3:0] f ;
    wire       carry_out, zero;

    alu uut (a, b, opcode, f, carry_out, zero);
    integer i;
    initial begin
    a=4'b0101;b=4'b0011;
    $display(" Idx |   a   |   b   | op  |   f   | carry  | zero |");
        for(i=0;i<8;i=i+1)begin
            {opcode} = i ;
            #3;
            $display("  %2d |  %4b |  %4b | %3b |  %4b |   %b    |   %b  |",
                 i, a, b, opcode, f, carry_out, zero);
            end
            $stop;
    end
endmodule
