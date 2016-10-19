`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
// Basic Synchronous D Latch
//
//////////////////////////////////////////////////////////////////////////////////

module D_Latch(clk, rst, wrt, d, // inputs
			  q);               // outputs

input  clk, rst, wrt, d;
output q;
reg    q;

always @ (posedge clk)
	if (rst) begin
		q <= 1'b0;
	end
	else if (wrt) begin
		q <= d;
	end

endmodule
