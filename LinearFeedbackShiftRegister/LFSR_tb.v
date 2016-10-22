`timescale 1ns / 1ps

module LFSR_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [7:0] result;

	// Instantiate the Unit Under Test (UUT)
	LinearFeedbackShiftRegister uut (
		.clk(clk), 
		.rst(rst), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		repeat (100) #5 clk = ~clk;
        
		// Add stimulus here

	end
      
endmodule

