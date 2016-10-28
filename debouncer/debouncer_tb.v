`timescale 1ns / 1ps

module debouncer_tb;

	// Inputs
	reg clk;
	reg rst;
	reg down;

	// Outputs
	wire debounceOut;

	// Instantiate the Unit Under Test (UUT)
	debouncer uut (
		.clk(clk), 
		.rst(rst), 
		.down(down), 
		.debounceOut(debounceOut)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		down = 0;
		#2;
		clk = 1;
		down = 1;
		#2;
		clk = 0;
		rst = 0;
		repeat (500) #2clk = ~clk;
		
		// Add stimulus here

	end
      
endmodule

