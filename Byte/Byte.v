`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// 8-bit Byte comprising Synchronous D Flip Flops
// Basic Indexed instantiation included
//
//////////////////////////////////////////////////////////////////////////////////

module Byte(clk, rst, wrt, data_in,  // inputs
			   data_out);          // outputs

parameter WIDTH = 8;

input  clk, rst, wrt;
input  [WIDTH-1:0] data_in;

output [WIDTH-1:0] data_out;

D_FlipFlop_enable DFF[WIDTH-1:0] (clk, rst, wrt, data_in, data_out);

endmodule
