`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:10:14 03/16/2018 
// Design Name: 
// Module Name:    Counter 
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
module Counter(out, M, in, clk, rst);

	output reg [31:0] out;
	
	input  [7:0] M;
	input  [7:0] in;
	input  clk;
	input  rst;
	
	reg [31:0] C;//Nc
	//reg [31:0] C0;
	reg [31:0] C0;//N0
	//reg [31:0] CM;//N m-1
	reg [7:0] N;//Nj
	reg [7:0] i;
	
	always@(posedge clk, posedge rst)
	begin
	
	if (rst)
		begin
		C <= 0; C0 <= 0; N <= 0; out <= 0; i <= 0;
		end
		
	else
		begin
		if (i < M)
			begin
				if (i == 0) C0 <= in;
				N <= (N + in)/2;
				C <= (C + (N + in)/2);
				i <= i + 1;
			end
		else
			begin
			out <= (C - ((C0 + N)/2))/(C0 - N);
			i <= M;
			end
		end
	end

endmodule
