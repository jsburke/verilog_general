`timescale 1ns / 1ps
`include "ALU_inc.v"
//////////////////////////////////////////////////////////////////////////////////
//
// 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(opcode, operand1, operand2,
           result, statusOut);

////////////////////
// inputs
////////////////////
input [3:0] opcode;
input [`WIDTH-1:0] operand1;
input [`WIDTH-1:0] operand2;

/////////////////////
// output
/////////////////////
output [`WIDTH-1:0] result;
output [3:0] statusOut;

//////////////////////
// internal
//////////////////////
wire [`WIDTH-1:0] resADD;
wire [`WIDTH-1:0] resSUB;
wire [`WIDTH-1:0] resMUL;
//wire [`WIDTH-1:0] resDIV;
//wire [`WIDTH-1:0] resREM;
wire [`WIDTH-1:0] resAND;
wire [`WIDTH-1:0] resOR;
wire [`WIDTH-1:0] resXOR;
wire [`WIDTH-1:0] resNOT;
wire [`WIDTH-1:0] resLSL;
wire [`WIDTH-1:0] resLSR;
wire [`WIDTH-1:0] resASR;
//wire [`WIDTH-1:0] resUDF;
//wire [`WIDTH-1:0] resUD0;
//wire [`WIDTH-1:0] resUD1;
//wire [`WIDTH-1:0] resUD2;

wire [3:0] stADD;
wire [3:0] stSUB;
wire [3:0] stMUL;
//wire [3:0] stDIV;
//wire [3:0] stREM;
wire [3:0] stAND;
wire [3:0] stOR;
wire [3:0] stXOR;
wire [3:0] stNOT;
wire [3:0] stLSL;
wire [3:0] stLSR;
wire [3:0] stASR;
//wire [3:0] stUDF;
//wire [3:0] stUD0;
//wire [3:0] stUD1;
//wire [3:0] stUD2;

//////////////////////
//hardware
//////////////////////

// initial pass in sub modules
Adder A1(operand1, operand2, resADD, stADD);
Subtractor S1(operand1, operand2, resSUB, stSUB);
Multiplier M1(operand1, operand2, resMUL, stMUL);
// Divider D1(operand1, operand2, resDIV, stDIV);
// Remainder R1(operand1, operand2, resREM, stREM);

BitAnd BA1(operand1, operand2, resAND, stAND);
BitOr BO1(operand1, operand2, resOR, stOR);
BitXor BX1(operand1, operand2, resXOR, stXOR);
BitNot BN1(operand1, resNOT, stNOT);

LogicalShift SL1(operand1, operand2, `LEFT, resLSL, stLSL);
LogicalShift SR1(operand1, operand2, `RIGHT, resLSR, stLSR);
ArithmeticShift AS1(operand1, operand2, resASR, stASR);

//MUXing based on the opcodes
assign result = (opcode == `ADD) ? resADD :
					 (opcode == `SUB) ? resSUB :
					 (opcode == `MUL) ? resMUL :
//					 (opcode == `DIV) ? resDIV :
//					 (opcode == `REM) ? resREM :
					 (opcode == `AND) ? resAND :
					 (opcode == `OR) ?  resOR  :
					 (opcode == `XOR) ? resXOR :
					 (opcode == `NOT) ? resNOT :
					 (opcode == `LSL) ? resLSL :
					 (opcode == `LSR) ? resLSR :
					 (opcode == `ASR) ? resASR :
					 0;

assign statusOut = (opcode == `ADD) ? stADD :
	    				 (opcode == `SUB) ? stSUB :
		    			 (opcode == `MUL) ? stMUL :
//			    		 (opcode == `DIV) ? stDIV :
//				    	 (opcode == `REM) ? stREM :
					    (opcode == `AND) ? stAND :
    					 (opcode == `OR) ?  stOR  :
	    				 (opcode == `XOR) ? stXOR :
		    			 (opcode == `NOT) ? stNOT :
			    		 (opcode == `LSL) ? stLSL :
				    	 (opcode == `LSR) ? stLSR :
					    (opcode == `ASR) ? stASR :
		    			 0;

endmodule
