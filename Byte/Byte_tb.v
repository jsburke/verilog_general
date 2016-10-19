`timescale 1ns / 1ps

module Byte_tb;

	parameter CYCLES = 12;
	integer   rand   = 0;
	// Inputs
	reg clk;
	reg rst;
	reg wrt;
	reg [7:0] data_in;

	// Outputs
	wire [7:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	Byte uut (
		.clk(clk), 
		.rst(rst),
		.wrt(wrt),
		.data_in(data_in), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		rand = $random($stime);
		clk = 0;
		rst = 1;
		wrt = 0;
		data_in = 0;
		#10;
		clk = 1;
		rst = 1;
		data_in = 0;
		#10;
		rst = 0;
		repeat(CYCLES * 2) begin
			clk = ~clk;
			if(clk) begin
				rand    = $random($stime + rand);
				data_in = rand[7:0];
			end
			if (rand[27]) begin
				wrt = 1;
			end
			else begin
				wrt = 0;
			end
			#10;
		end
        
		// Add stimulus here

	end
      
endmodule

