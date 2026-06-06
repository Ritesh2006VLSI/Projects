`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2026 16:28:38
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


module mux4to1(
    input [3:0]i,
    input [1:0]s,
    output reg y
    );
    always@(*)begin
        case(s)
            2'b00 : y = i[0];
            2'b01 : y = i[1];
            2'b10 : y = i[2];
            2'b11 : y = i[3];
            default : y = i[0];
        endcase
    end
endmodule
