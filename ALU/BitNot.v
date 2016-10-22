`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//  Bitwise NOT
//
//////////////////////////////////////////////////////////////////////////////////
module BitNot(operand,             //  inputs
				  result, statusOut);  //  outputs
 
input [WIDTH-1:0] operand1;

output wire [WIDTH-1:0] result;
output wire [3:0]       statusOut;

assign result = ~operand;
assign statusOut[ST_NEG] = result[WIDTH-1];
assign statusOut[ST_ZERO] = (result == 0) ? 1 : 0;
assign statusOut[ST_CARRY] = 0;  //  carry and overflow cannot be set by this
assign statusOut[ST_OVERFLOW] = 0;

endmodule