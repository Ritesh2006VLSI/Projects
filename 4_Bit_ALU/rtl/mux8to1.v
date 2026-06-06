`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2025 10:17:44
// Design Name: 
// Module Name: mux8to1
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


module mux8to1(
    input [3:0] i0,i1,i2,i3,i4,i5,i6,i7,
    input s0,s1,s2,
    output reg [3:0] y
    );
    always @(*)begin
        case({s2,s1,s0})
            3'b000 : y = i0 ;
            3'b001 : y = i1 ;
            3'b010 : y = i2 ;
            3'b011 : y = i3 ;
            3'b100 : y = i4 ;
            3'b101 : y = i5 ;
            3'b110 : y = i6 ;
            3'b111 : y = i7 ;
            default: y = 4'b0000;
        endcase
    end
endmodule
