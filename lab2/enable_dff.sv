//creates a single enable_DFF, no gate delays
`timescale 1ns/10ps
module enable_dff(clk, reset, enable, writeData, q);

	/*clk and reset are built in input.
	enable is going to be fed in, write can be thought of as user input
	q is the output of the enable_dff
	*/
	input logic clk, reset, enable, writeData;
	output logic q;
	
	logic q_old, d_input;
		
		//2:1 mux to enable write or not. if en = 0, output old data, if en = 1, output new written data
		two_one_mux m(.sel(enable), .writeQ(writeData), .Qold(q_old), .out(d_input));
		
		d_ff d_inst(.clk(clk), .reset(reset), .d(d_input), .q(q_old));
	
	assign q = q_old;
	
endmodule
	
	