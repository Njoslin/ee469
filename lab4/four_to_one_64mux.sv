module four_to_one_64mux(in0, in1, in2, sel, finalOutput);
	input logic [63:0] in0, in1, in2;
	
	input logic [1:0] sel;
	
	output logic [63:0] finalOutput;
	
	
	genvar i; 

	generate
	
		for(i = 0; i < 64; i++) begin: muxes
			 logic [3:0] d;
           assign d = {in2[i], in1[i], in0[i]}; // MSB to LSB
           four_one_mux m(.d(d), .sel(sel), .four_one_out(finalOutput[i]));
		end
	endgenerate
	
	
endmodule