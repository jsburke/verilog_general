`timescale 1ns / 1ps
`include "ALU_inc.v"
//////////////////////////////////////////////////////////////////////////////////
//
//
//
//////////////////////////////////////////////////////////////////////////////////
module Subtractor(operand1, operand2,
                  result, statusOut);
						
input [`WIDTH-1:0] operand1;
input [`WIDTH-1:0] operand2;

output [`WIDTH-1:0] result;
output [3:0]       statusOut;

wire [`WIDTH-1:0] opr2Id;  // for the -x = not(x) + 1 id in 2's c.

assign opr2Id = (~operand2) + 1;
Adder Asub(operand1, opr2Id, result, statusOut);

endmodule
