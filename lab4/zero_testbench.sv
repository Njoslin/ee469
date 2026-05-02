`timescale 1ns/10ps
module zero_testbench;

	logic [63:0] zr; 
	logic zeroFlag;
	
	initial begin 
		zr = 64'b0; #1000;
		 
		zr = 64'b0000000000000000000000000000000000000000000000000000000000100001; #1000;
	end

	zero dut(.zr(zr), .zeroFlag(zeroFlag));
	
endmodule

		