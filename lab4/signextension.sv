`timescale 1ns/10ps
module signextension(instructions, out);
	input logic [31:0] instructions;
	output logic [63:0] out;
	
	logic [63:0] hold;
	
	logic [1:0] sel;
	
	logic [63:0] b_ext, d_ext, i_ext, cb_ext; //new extending values
	
	logic [25:0] b_type;
	logic [8:0] d_type;
	logic [11:0] i_type;
	logic [18:0] cb_type; //19 bits for cond_branch
	
	assign b_type = instructions[25:0]; //shift 26 bit field by 2.
	assign d_type = instructions[20:12];
	assign i_type = instructions[21:10];
	assign cb_type [18:0] = instructions[23:5]; //shift 19 bit field by 2.
	
	assign b_ext  = {{(38){b_type[25]}}, b_type};
	assign d_ext  = {{(55){d_type[8]}}, d_type};
	assign cb_ext [63:0] = {{(45){cb_type[18]}}, cb_type};
	assign i_ext [63:0] = {{(52){1'b0}}, i_type}; //i-type always zero extended
	
	decoderForSignExten a(.instructions(instructions), .mux_src(sel)); //getting the sel values
	
	genvar i; 

	generate
	
		for(i = 0; i < 64; i++) begin: muxes
			four_one_mux a(.d({cb_ext[i], b_ext[i], d_ext[i], i_ext[i]}), .sel(sel), .four_one_out(hold[i]));
		end
	endgenerate
	
	assign out = hold; //sign extended 64 bit output, will go to 
endmodule

	