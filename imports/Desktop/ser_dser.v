`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:09:39 03/17/2018 
// Design Name: 
// Module Name:    ser_dser 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ser_dser(in,out,clk,reset
    );
input [7:0] in;
output [7:0] out;
input clk,reset;
wire tmp;
serializer ser1(in,tmp,clk,reset);
de_serializer dser1(tmp,out,clk,reset);

endmodule
