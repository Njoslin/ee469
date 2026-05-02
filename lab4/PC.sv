module PC(inPC, outPC, clk, reset, enable);
	input logic [63:0] inPC;
	input logic clk, reset, enable;
	output logic [63:0] outPC;
	
	
	//grabbing my lockers for the data
	//sending my input to the 64bit d_ff to hold the data, basically a 64 bit reg
	Uni_Enable_DFF #(.WIDTH(64)) PC(.clk(clk), .reset(reset), .enable(enable),
	.writeData(inPC), .q(outPC));
	
	
endmodule

	
	