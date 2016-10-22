`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//
//
//////////////////////////////////////////////////////////////////////////////////
module LinearFeedbackShiftRegister(clk, rst,
											  result);

parameter WIDTH = 8;
parameter INIT  = 1;

///////////////////
// inputs
///////////////////
input clk, rst;

////////////////////
//  OUTPUTS
////////////////////
output reg [WIDTH-1:0] result;

////////////////////
// hardware
////////////////////

initial begin
	result = INIT;
end

always @ (posedge clk) begin
	if (rst) begin
		result = INIT;
	end
	else result = {result[0] ^ result[1] ^ result[5], result[WIDTH-1:1]};
end									  


endmodule