`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//  Basic Adder that allows for overflow.  ie FF + 01 = 0 etc
//
//////////////////////////////////////////////////////////////////////////////////
module Adder(operand1, operand2,
             result, statusOut);
				 
input [WIDTH-1:0] operand1;
input [WIDTH-1:0] operand2;

output [WIDTH-1:0] result;
output [3:0]       statusOut;

wire [1:0] signs;

assign signs = {operand1[WIDTH-1], operand2[WIDTH-1]};
assign {statusOut[ST_CARRY], result} = operand1 + operand2;
assign statusOut[ST_NEG] = result[WIDTH-1];
assign statusOut[ST_ZERO] = (result == 0) ? 1 : 0;
assign statusOut[ST_OVERFLOW] = (signs[1] != signs[0]) ? 0 : (signs[0] == result[WIDTH-1]) ? 0 : 1;

endmodule
