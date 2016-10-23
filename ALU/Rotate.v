`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//
//
//////////////////////////////////////////////////////////////////////////////////
module Rotate(operand1, operand2, leftRight,  // inputs
                    result, statusOut);             // outputs
				 
input [WIDTH-1:0] operand1;
input [WIDTH-1:0] operand2;
input leftRight;  //  0 shift left || 1 shift right

output [WIDTH-1:0] result;
output [3:0]       statusOut;

assign result = (operand2%WIDTH == 0) ? operand1 :
						(leftRight && (operand2%WIDTH == 1)) ? {operand1[0], operand1[WIDTH-1:1]} :  // right rotates
						(leftRight) ? {operand1[(operand2%WIDTH)-1:0], operand1[WIDTH-1:operand2%WIDTH]} :
						(operand2%WIDTH == 1) ? {operand1[WIDTH-2:0], operand1[WIDTH-1]} :  // left rotates
						                        {operand1[WIDTH-1-(operand2%WIDTH):0], operand1[WIDTH-1:operand2%WIDTHS]};
assign statusOut[ST_CARRY] = 0;
assign statusOut[ST_NEG] = result[WIDTH-1];
assign statusOut[ST_ZERO] = (result == 0) ? 1 : 0;
assign statusOut[ST_OVERFLOW] = 0;

endmodule
