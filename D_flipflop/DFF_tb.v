`timescale 1ns / 1ps

module DFF_tb;

	// Inputs
	reg clk;
	reg rst;
	reg d;

	// Outputs
	wire q;

	// Instantiate the Unit Under Test (UUT)
	DFF uut (
		.clk(clk), 
		.rst(rst), 
		.d(d), 
		.q(q)
	);

	initial begin
		clk = 0;
		rst = 1;
		d = 0;
		#10;
		clk = 1;
		rst = 1;
		d = 0;
		#10;
		
		clk = 0;
		rst = 0;
		d = 1;
		#10;
		clk = 1;
		rst = 0;
		d = 1;
		#10;
		
		clk = 0;
		rst = 0;
		d = 1;
		#10;
		clk = 1;
		rst = 0;
		d = 1;
		#10;
		
		clk = 0;
		rst = 0;
		d = 0;
		#10;
		clk = 1;
		rst = 0;
		d = 0;
		#10;
		
		clk = 0;
		rst = 0;
		d = 0;
		#10;
		clk = 1;
		rst = 0;
		d = 0;
		#10;
        
		// Add stimulus here

	end
      
endmodule

