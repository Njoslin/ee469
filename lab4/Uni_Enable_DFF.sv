//creates a single enable_DFF, no gate delays
`timescale 1ns/10ps
module Uni_Enable_DFF#(parameter WIDTH = 64)(input logic [WIDTH-1:0] writeData, 
input logic clk, reset, enable, output logic [WIDTH-1:0] q);

	logic[WIDTH-1:0] q_old, d_input;
		genvar i;
		generate
		
			for(i = 0; i < WIDTH; i++) begin: paramEnableDFF
			//2:1 mux to enable write or not. if en = 0, output old data, if en = 1, output new written data
		
			two_one_mux m(.sel(enable), .writeQ(writeData[i]), .Qold(q_old[i]), .out(d_input[i]));
			d_ff d_inst(.clk(clk), .reset(reset), .d(d_input[i]), .q(q_old[i]));
		end
	
	endgenerate
	
	assign q = q_old;
	
endmodule
	