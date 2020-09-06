`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Mohamed Ammar
//
// Create Date:   00:15:14 09/06/2020
// Design Name:   fibonacci
// Module Name:  verilog/fibonacci/fib_tf.v
// Project Name:  fibonacci
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fibonacci
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fib_tf;

	// Inputs
	reg clock;
	reg reset;
	reg [7:0] N;

	// Outputs
	wire [7:0] fib;

	// Instantiate the Unit Under Test (UUT)
	fibonacci uut (
		.clock(clock), 
		.reset(reset), 
		.fib(fib), 
		.N(N)
	);

	initial begin
		// Initialize Inputs
		clock = 0;
		reset = 0;
		N = 0;

		// Wait 100 ns for global reset to finish
		#1 reset = 1 ;
      #10 reset= 0 ;              //Wait one cycle , reset = 0 at 11 ns 
		// Add stimulus here
	#5   N = 7;
	#100  $finish ;
	end
      always #5 clock = ~clock;     //10ns cycle , 100MHZ
endmodule

