`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//
//
//////////////////////////////////////////////////////////////////////////////////
module Multiplier(operand1, operand2,
             result, statusOut);
				 
input [WIDTH-1:0] operand1;
input [WIDTH-1:0] operand2;

output [WIDTH-1:0] result;
output [3:0]       statusOut;

wire [1:0] signs;
wire [WIDTH*2:0] extra;  // extra bits for multiply and sign.  result truncaes this, but keeps sign

assign signs = {operand1[WIDTH-1], operand2[WIDTH-1]};
assign extra = operand1 * operand2;
assign result = {extra[WIDTH*2], extra[WIDTH-2:0]};
assign statusOut[ST_CARRY] = 0;
assign statusOut[ST_NEG] = extra[WIDTH*2];
assign statusOut[ST_ZERO] = (result == 0) ? 1 : 0;
assign statusOut[ST_OVERFLOW] = (signs[1] != signs[0]) ? 0 : (extra[(WIDTH*2):WIDTH != 0]) ? 1: (signs[0] == result[WIDTH-1]) ? 0 : 1;

endmodule