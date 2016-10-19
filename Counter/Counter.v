`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//  Counter Module with adjustable count width
//
//////////////////////////////////////////////////////////////////////////////////
module Counter(clk, rst, enable, upDown,  // inputs
					countOut);                // output
parameter COUNT_WIDTH = 8;

////////////////////
// inputs
////////////////////
input clk, rst, enable, upDown;  // upDown: 1 == + || 0 == -

////////////////////
// outputs
////////////////////
output reg [COUNT_WIDTH-1:0] countOut;

////////////////////
// hardware
////////////////////

always @ (posedge clk) begin
	if (rst) begin
		countOut <= 0;
	end
	else if (enable) begin
		if (upDown) begin 
			if (countOut < (2 ** COUNT_WIDTH - 1)) begin
				countOut <= countOut + 1'b1;
			end
			else begin
				countOut <= 0;			
			end
		end
		else begin
			if (countOut > 0) begin
				countOut <= countOut - 1'b1;
			end
			else begin
				countOut <= -1;				
			end
		end
	end
end


endmodule
