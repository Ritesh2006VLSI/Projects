`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.12.2025 10:23:57
// Design Name: 
// Module Name: alu
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


module alu(
    input  [3:0] a,b,
    input  [2:0] opcode,
    output [3:0] f,
    output   reg carry_out,
    output   zero
    );
    wire [4:0] add5 = {1'b0, a} + {1'b0, b};
    wire [4:0] sub5 = {1'b0, a} - {1'b0, b};
    wire [4:0] inc5 = {1'b0, a} + 5'b00001;
    wire [4:0] dec5 = {1'b0, a} - 5'b00001;
    wire [3:0] i0 = add5[3:0];
    wire [3:0] i1 = sub5[3:0];
    wire [3:0] i2 = a & b;
    wire [3:0] i3 = a | b; 
    wire [3:0] i4 = a ^ b; 
    wire [3:0] i5 = ~a;
    wire [3:0] i6 = inc5[3:0];
    wire [3:0] i7 = dec5[3:0];
    mux8to1 m1(
        .i0(i0), .i1(i1), .i2(i2), .i3(i3), .i4(i4), .i5(i5), .i6(i6), .i7(i7),
        .s0(opcode[0]), .s1(opcode[1]), .s2(opcode[2]),
        .y(f)
    );
    always @(*) begin
        case (opcode)
            3'b000 : carry_out = add5[4];
            3'b001 : carry_out = sub5[4]; 
            3'b110 : carry_out = inc5[4];
            3'b111 : carry_out = dec5[4];
            default: carry_out = 1'b0 ;
        endcase
    end
    assign zero = (f == 4'b0000);  
endmodule

