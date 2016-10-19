`timescale 1ns / 1ps

module RegisterFile_tb;
	
	integer rand   = 0;
	integer cycles = 10;
	integer i      = 0;
	// Inputs
	reg clk;
	reg rst;
	reg [2:0] rdAddr1;
	reg [2:0] rdAddr2;
	reg [2:0] wrtAddr;
	reg [15:0] wrtData;
	reg wrtEnable;

	// Outputs
	wire [15:0] rdData1;
	wire [15:0] rdData2;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.clk(clk), 
		.rst(rst), 
		.rdAddr1(rdAddr1), 
		.rdAddr2(rdAddr2), 
		.wrtAddr(wrtAddr), 
		.wrtData(wrtData), 
		.wrtEnable(wrtEnable), 
		.rdData1(rdData1), 
		.rdData2(rdData2)
	);

	initial begin
		clk = 0;
		rst = 1;
		rdAddr1 = 0;
		rdAddr2 = 0;
		wrtAddr = 0;
		wrtData = 0;
		wrtEnable = 0;
		#10;
		clk = 1;
		rst = 1;
		rdAddr1 = 0;
		rdAddr2 = 0;
		wrtAddr = 0;
		wrtData = 0;
		wrtEnable = 0;
		#10;
		clk = 0;
		rst = 0;
		rdAddr1 = 0;
		rdAddr2 = 0;
		wrtAddr = 0;
		wrtData = 0;
		wrtEnable = 0;
      repeat(16)  begin
			#10;
			clk = ~clk;
			if (clk) begin
				rand = $random($stime + rand);
				wrtData = rand[15:0];
				wrtAddr = i;
				wrtEnable = 1;
			end else begin
				wrtEnable = 0;
				i = i + 1;
			end
		end
		repeat(cycles *2) begin
			#10
			clk = ~clk;
			if (clk) begin
				rand = $random($stime + rand);
				rdAddr1 = rand[22:20];
				rdAddr2 = rand[2:0];
			end
		end
	end
      
endmodule

