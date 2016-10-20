`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//  LIFO with push-pop signal
//
//////////////////////////////////////////////////////////////////////////////////

module Lifo(rst, enable, pushPop,  //  input
				data);			        //  bidirectional

parameter  WIDTH  = 8;
parameter  DEPTH  = 12;
localparam PTR_SZ = 32;  //  to be generalized later with something like $clog2()

integer i;

///////////////////////////
// inputs
///////////////////////////
input rst, enable, pushPop;

///////////////////////////
// didrictional data line
///////////////////////////
inout [WIDTH-1:0] data;

///////////////////////////
// internal
///////////////////////////
reg [WIDTH-1:0] mem  [DEPTH-1:0];
reg [PTR_SZ-1:0] stackPointer;  // 0 means stack empty ||  == DEPTH means stack full
reg [WIDTH-1:0] inData;

///////////////////////////
//  hardware
///////////////////////////
always @ (rst or enable or pushPop) begin
	if (rst) begin
		for (i = 0; i < DEPTH;  i = i + 1) mem[i] = 0;
		stackPointer = 0;
		for (i = 0; i < WIDTH; i = i + 1) inData[i] = 1'bz;
	end
	else begin
		if (enable) begin
			if (pushPop) begin // pushing onto stack
				if (stackPointer < DEPTH) begin
					mem[stackPointer] = data;
					stackPointer = stackPointer + 1;
				end
			end
			else begin  //popping from stack
				if (stackPointer > 0) begin
					inData = mem[stackPointer-1];
					mem[stackPointer-1] = 0;
					stackPointer = stackPointer - 1;
				end
			end
		end
		else begin
			for (i = 0; i < WIDTH; i = i + 1) inData[i] = 1'bz;
		end
	end
end

assign data = (~rst && enable && pushPop) ? data : inData;  //  Basically only show data on push, otherwise inData

endmodule
