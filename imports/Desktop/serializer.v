`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:29:57 03/17/2018 
// Design Name: 
// Module Name:    serializer 
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
module serializer(in,out,clk,reset
    );
input [7:0]in;
output out;
input clk,reset;
reg [3:0] count;
always@(posedge clk or negedge reset)begin
	if(~reset)begin
	count<=0;
	end
	else begin
		if(count<=7)begin
		count<=count+1;
		end
		else begin
		count<=1;
		end
	end

end

assign out=in[count-1];

endmodule
