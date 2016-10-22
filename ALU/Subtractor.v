`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:20:09 10/21/2016 
// Design Name: 
// Module Name:    Subtractor 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Subtractor(operand1, operand2,
                  result, statusOut);
						
input [WIDTH-1:0] operand1;
input [WIDTH-1:0] operand2;

output [WIDTH-1:0] result;
output [3:0]       statusOut;

wire [WIDTH-1:0] opr2Id;  // for the -x = not(x) + 1 id in 2's c.

assign opr2Id = (~operand2) + 1;
Adder Asub(operand1, opr2Id, result, statusOut);

endmodule
