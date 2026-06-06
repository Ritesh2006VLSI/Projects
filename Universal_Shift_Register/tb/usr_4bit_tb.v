`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2026 17:23:08
// Design Name: 
// Module Name: usr_4bit_tb
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


module usr_4bit_tb();
    reg clk;
    reg rst;
    reg [1:0] s;
    reg s_r_in;
    reg s_l_in;
    reg [3:0] p_in;
    wire [3:0] q;
    usr_4bit dut (.clk(clk),.rst(rst),.s(s),.s_r_in(s_r_in),.s_l_in(s_l_in),.p_in(p_in),.q(q));
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst = 1;
        s = 2'b00;
        s_r_in = 0;
        s_l_in = 0;
        p_in = 4'b0000;
        // Reset
        #10 rst = 0;
        // Parallel Load: load 1011
        #10 s = 2'b11;
        p_in = 4'b1011;
        // Hold (should remain 1011)
        #10 s = 2'b00;
        #20;
        // Shift Right
        // s_r_in = 1
        #10 s = 2'b01;
        s_r_in = 1;
        #20;
        // Shift Left
        // s_l_in = 0
        #10 s = 2'b10;
        s_l_in = 0;
        #20;

        $finish;
    end
    initial begin
        $monitor("Time=%0t | s=%b | p_in=%b | q=%b",
                  $time, s, p_in, q);
    end
endmodule
