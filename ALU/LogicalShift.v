`timescale 1ns / 1ps
`include "ALU_inc.v"
//////////////////////////////////////////////////////////////////////////////////
//
//
//
//////////////////////////////////////////////////////////////////////////////////
module LogicalShift(operand1, operand2, leftRight,  // inputs
                    result, statusOut);             // outputs
				 
input [`WIDTH-1:0] operand1;
input [`WIDTH-1:0] operand2;
input leftRight;  //  0 shift left || 1 shift right

output [`WIDTH-1:0] result;
output [3:0]        statusOut;

assign result = (leftRight) ? operand1 >> operand2 : operand1 << operand2;
assign statusOut[`ST_CARRY] = (operand2 > `WIDTH) ? 0 : (leftRight) ? operand1[operand2-1] : operand1[`WIDTH - operand2 - 2];
assign statusOut[`ST_NEG] = result[`WIDTH-1];
assign statusOut[`ST_ZERO] = (result == 0) ? 1 : 0;
assign statusOut[`ST_OVERFLOW] = 0;

endmodule
