`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//  LIFO with push-pop signal
//
//////////////////////////////////////////////////////////////////////////////////

module Lifo(rst, enable, pushPop, pushData,  //  input
				popData);      			        //  bidirectional

parameter WIDTH  = 8;
parameter DEPTH  = 12;
parameter PTR_SZ = 16;  //  to be generalized later with something like $clog2()

integer i;

///////////////////////////
// inputs
///////////////////////////
input rst, enable, pushPop;
input [WIDTH-1:0] pushData;

///////////////////////////
// didrictional data line
///////////////////////////
output reg [WIDTH-1:0] popData;

///////////////////////////
// internal
///////////////////////////
reg [WIDTH-1:0] mem  [DEPTH-1:0];
reg [PTR_SZ-1:0] stackPointer;  // 0 means stack empty ||  == DEPTH means stack full

///////////////////////////
//  hardware
///////////////////////////

always @ (rst or enable or pushPop or pushData) begin
	if (rst) begin // reset the internals to zero
		stackPointer = 0;
		for (i = 0; i < DEPTH; i = i + 1) mem[i] = 0;
		for (i = 0; i < WIDTH; i = i + 1) popData[i] = 1'bz;
	end
	else begin     // reset is low
		if (enable) begin
			if (pushPop) begin  // push
				if (pushPop < DEPTH) begin  // still can fit data
					mem[stackPointer] = pushData;
					stackPointer = stackPointer + 1;
					for (i = 0; i < WIDTH; i = i + 1) popData[i] = 1'bz;
				end
				else begin // no more room to push
					for (i = 0; i < WIDTH; i = i + 1) popData[i] = 1'bz;
				end
			end
			else begin  // pop
				if (stackPointer > 0) begin  // exists data to pop
					popData = mem[stackPointer-1];
					stackPointer = stackPointer - 1;  // can swap this with the line above to not index by -1
				end
				else begin  // no data to pop
					for (i = 0; i < WIDTH; i = i + 1) popData[i] = 1'bz;
				end
			end
		end
		else begin // enable is low
			for (i = 0; i < WIDTH; i = i + 1) popData[i] = 1'bz;			
		end
	end
end


endmodule
