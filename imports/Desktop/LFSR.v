`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:34:45 03/16/2018 
// Design Name: 
// Module Name:    LFSR 
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
module LFSR(out,enable,clk,reset
    );
output reg [30:0] out;

input enable,clk,reset;
wire linear_feedback;
assign linear_feedback=!(out[30]^out[27]);
reg [30:0] c;
always@(posedge clk or posedge reset)begin
if (reset)begin
out<=31'b0;

c<=0;
end 
else if(enable)begin
out<={out[29:0],linear_feedback};
c<=c+1;
end
end
endmodule
