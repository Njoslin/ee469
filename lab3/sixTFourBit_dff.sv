//creating a 64 bit d_ff to hold each bit of the input to pc/instructions
`timescale 1ns/10ps
module sixTFourBit_dff(pc_in, clk, reset, pc_out);
	input logic clk, reset;
	
	//will come from the pc
	input logic [63:0] pc_in;
	
	//will be outputted to the pc
	output logic [63:0] pc_out;
	
	genvar i;
	
	generate
	
		for(i = 0; i < 64; i++)begin : eachD_ff
			d_ff d_inst(.d(pc_in[i]), .q(pc_out[i]), .clk(clk), .reset(reset));
		end
	endgenerate
endmodule

	
	
	
