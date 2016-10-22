`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(opcode, operand1, operand2, statusIn,
           result, statusOut);

`define WIDTH       = 16;

// clear indexes for status
`define ST_NEG      = 0;
`define ST_ZERO     = 1;
`define ST_CARRY    = 2;
`define ST_OVERFLOW = 3;


////////////////////
// inputs
////////////////////
input [3:0] opcode;
input [3:0] statusIn;
input [WIDTH-1:0] operand1;
input [WIDTH-1:0] operand2;

/////////////////////
// output
/////////////////////
output reg [WIDTH-1:0] result;
output reg [3:0] statusOut;

/////////////////////
// opcodes
// only for use in this ALU
/////////////////////
`define ADD = 4'h0;
`define SUB = 4'h1;
`define MUL = 4'h2;
`define DIV = 4'h3;
`define REM = 4'h4;
`define AND = 4'h5;
`define OR  = 4'h6;
`define XOR = 4'h7;
`define NOT = 4'h8;
`define LSL = 4'h9;
`define LSR = 4'hA;
`define ASR = 4'hB;
`define ROR = 4'hC;
`define ROL = 4'hD;
`define RCR = 4'hE; // might change rotate through carry later...
`define RCL = 4'hF;


//////////////////////
//hardware
//////////////////////

/*always @ (opcode or operand1 or operand2) begin*/
	BitAnd(operand1, operand2, result, statusOut);
/*end
endmodule*/
