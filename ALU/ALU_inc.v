`ifndef ALU_inc_v
`define ALU_inc_v

////////////////////////////
`define WIDTH        16

// clear indexes for status
`define ST_NEG       0
`define ST_ZERO      1
`define ST_CARRY     2
`define ST_OVERFLOW  3


/////////////////////
// opcodes
// only for use in this ALU
/////////////////////
`define ADD  4'h0
`define SUB  4'h1
`define MUL  4'h2
`define DIV  4'h3
`define REM  4'h4
`define AND  4'h5
`define OR   4'h6
`define XOR  4'h7
`define NOT  4'h8
`define LSL  4'h9
`define LSR  4'hA
`define ASR  4'hB
//`define UDF  4'hC // undefined fns
//`define UD0  4'hD
//`define UD1 = 4'hE
//`define UD2 = 4'h;

`define RIGHT  1
`define LEFT   0
////////////////////////////
`endif 