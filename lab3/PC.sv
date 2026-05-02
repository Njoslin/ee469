module PC(inPC, outPC, clk, reset);
	input logic [63:0] inPC;
	input logic clk, reset;
	output logic [63:0] outPC;
	
	
	//grabbing my lockers for the data
	//sending my input to the 64bit d_ff to hold the data, basically a 64 bit reg
	sixTFourBit_dff sixT_inst(.pc_in(inPC), .pc_out(outPC), .clk(clk), .reset(reset));
	
endmodule

	
	