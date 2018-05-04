`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:09:42 03/21/2018
// Design Name:   ser_dser
// Module Name:   /home/ise/xlinx_share/project_551/read_file.v
// Project Name:  project_551
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ser_dser
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module read_file;

	// Inputs
	reg [7:0] in;
	reg clk;
	reg reset;
	reg[21:0] captured_data;
	// Outputs
	wire [7:0] out;
	integer               data_file    ; // file handler
	integer               scan_file    ; // file handler
	
	`define NULL 0    
	// Instantiate the Unit Under Test (UUT)
	ser_dser uut (
		.in(in), 
		.out(out), 
		.clk(clk), 
		.reset(reset)
	);

	

	initial begin
	clk=0;
	data_file = $fopen("test_file.txt", "r");
	if (data_file == `NULL) begin
    $display("data_file handle was NULL");
    $finish;
   end
	end

always @(posedge clk) begin
  scan_file = $fscanf(data_file, "%d\n", captured_data); 
  if (!$feof(data_file)) begin
    $display("%d\n",captured_data);
  end
end
always begin
#5;
clk=~clk;
end  
endmodule

