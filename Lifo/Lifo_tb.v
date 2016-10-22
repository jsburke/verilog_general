`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
//
//
// 
////////////////////////////////////////////////////////////////////////////////

module Lifo_tb;

	// Inputs
	reg rst;
	reg enable;
	reg pushPop;
	reg [7:0] pushData;

	// Outputs
	wire [7:0] popData;

	// Instantiate the Unit Under Test (UUT)
	Lifo uut (
		.rst(rst), 
		.enable(enable), 
		.pushPop(pushPop), 
		.pushData(pushData), 
		.popData(popData)
	);

	initial begin
		// Initialize Inputs
		rst = 0;
		enable = 0;
		pushPop = 0;
		pushData = 0;
		#5;
		rst = 1;
		#5;
		rst = 0;
		#5;
		enable = 1;
		pushPop = 1;
		pushData = 8'ha0;
		#5;
		pushData = 8'hea;
		#5;
		pushData = 8'h11;
		#5;
		pushData = 8'hb4;
		#5;
		pushData = 8'he1;
		#5;
		pushData = 8'hd7;
		#5;
		pushData = 8'h33;
		#5;
		pushData = 8'h42;
		#5;
		pushData = 8'hff;
		#5;
		pushData = 8'h00;
		#5;
		pushData = 8'hab;
		#5;
		pushData = 8'hbe;
		#5;
		enable = 0;
		#5;
		pushPop = ~pushPop;
		#5;
		repeat (14) begin
			enable = ~enable;
			#5;
		end
		enable = 1;
		pushPop = 1;
		pushData = 8'hff;
		#5
		pushData = 8'h22;
		#5
		pushPop = 0;
        
		// Add stimulus here

	end
      
endmodule

