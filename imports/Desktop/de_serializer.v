`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:06:43 03/17/2018 
// Design Name: 
// Module Name:    de_serializer 
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
module de_serializer(in,out,clk,reset
    );
input in,clk,reset;
output reg[7:0]out;
reg [3:0]count;
always@(posedge clk or negedge reset)begin
if(~reset)count<=0;
else begin
	if(count<=7)begin
	count<=count+1;
	end
	else begin
	count<=1;
	end
end
end
always@(count)begin
out[count-1]=in;
end
endmodule
