`timescale 1ns / 1ps
module Counter_tb;

	// Inputs
	reg clk;
	reg rst;
	reg enable;
	reg upDown;

	// Outputs
	wire [7:0] countOut;

	// Instantiate the Unit Under Test (UUT)
	Counter uut (
		.clk(clk), 
		.rst(rst), 
		.enable(enable), 
		.upDown(upDown), 
		.countOut(countOut)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		enable = 0;
		upDown = 1;  // modify me to see decrements
		#1;
      clk = 1;
		rst = 1;
		#1;
		clk = 0;
		rst = 0;
		enable = 1;
		#1;
		repeat(300 * 2) begin
			clk = ~clk;
			#1;
		end
	end
      
endmodule

