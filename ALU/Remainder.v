`timescale 1ns / 1ps
`include "ALU_inc.v"
//////////////////////////////////////////////////////////////////////////////////
//
//
//////////////////////////////////////////////////////////////////////////////////
module Remainder(operand1, operand2,
                 result, statusOut);
				 
input [`WIDTH-1:0] operand1;
input [`WIDTH-1:0] operand2;

output [`WIDTH-1:0] result;
output [3:0]       statusOut;

assign result = operand1 % operand2;
assign statusOut[`ST_NEG] = result[`WIDTH-1];
assign statusOut[`ST_ZERO] = (result == 0) ? 1 : 0;
assign statusOut[`ST_CARRY] = 0;
assign statusOut[`ST_OVERFLOW] = 0;
endmodule
