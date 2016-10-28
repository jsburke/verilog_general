`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
//  A simple debouncer module based on a counter
//
//////////////////////////////////////////////////////////////////////////////////
module debouncer(clk, rst, down,
                 debounceOut);

parameter thresh = 100;  // set low for my own testbench

input  clk, rst, down;
output debounceOut;

reg [15:0] count;

always @ (posedge clk) begin
	if (rst) begin
		count <=0;
	end
	else if (down) begin // button down
		if (count >= thresh) begin
			count <= thresh;
		end
		else count <= count +1;
	end
	else begin
		count <= 0;
	end
end

assign debounceOut = (count >= thresh) ? 1 : 0;

endmodule
