`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//  Generic Register File Of variable word size and register count
//  All Assumed to be GP
//  Single write
//  Double read
//
//////////////////////////////////////////////////////////////////////////////////
module RegisterFile(clk, rst, rdAddr1, rdAddr2, wrtAddr, wrtData, wrtEnable,  //  inputs
                    rdData1, rdData2);														//  outputs
parameter WORD_SIZE  = 16;
parameter ADDR_SIZE  = 3;
parameter REG_MAX    = 2**ADDR_SIZE;

////////////
// input
////////////
input clk, rst, wrtEnable;

input [ADDR_SIZE-1:0] rdAddr1;
input [ADDR_SIZE-1:0] rdAddr2;
input [ADDR_SIZE-1:0] wrtAddr;

input [WORD_SIZE-1:0] wrtData;

////////////
// output
////////////
output reg [WORD_SIZE-1:0] rdData1;
output reg [WORD_SIZE-1:0] rdData2;

////////////
// internal
////////////
reg [WORD_SIZE-1:0] genReg[REG_MAX-1:0];

////////////
// HARDWARE
////////////

integer i;

// writing block
always @ (posedge clk) begin  
	if (rst) begin
		for(i = 0; i < REG_MAX; i = i+1) genReg[i] <= 0;
	end
	else if (wrtEnable) begin
		genReg[wrtAddr] <= wrtData;
	end
end

// reading block 1
always @ (posedge clk) begin  
	if (rst) begin
		rdData1 <= 0;
	end
	else begin
		rdData1 <= genReg[rdAddr1];
	end
end

// reading block 2
always @ (posedge clk) begin  
	if (rst) begin
		rdData2 <= 0;
	end
	else begin
		rdData2 <= genReg[rdAddr2];
	end
end

endmodule
