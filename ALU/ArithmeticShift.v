`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//  always ASR since ASL == LSL
//
//////////////////////////////////////////////////////////////////////////////////
module ArithmeticShift(operand1, operand2,  // inputs
                       result, statusOut);  // outputs
				 
input [WIDTH-1:0] operand1;
input [WIDTH-1:0] operand2;

output [WIDTH-1:0] result;
output [3:0]       statusOut;

assign result = operand1 >>> operand2;
assign statusOut[ST_CARRY] = (operand2 > WIDTH) ? operand1[WIDTH-1] : operand1[operand2-1];
assign statusOut[ST_NEG] = result[WIDTH-1];
assign statusOut[ST_ZERO] = (result == 0) ? 1 : 0;
assign statusOut[ST_OVERFLOW] = 0;

endmodule