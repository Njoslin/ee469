module two_to_one_writeRegisterMux (in0, in1, sel, finalOutput);
	input logic [4:0] in0, in1;
	
	input logic sel;
	
	output logic [4:0] finalOutput;
	
	logic [4:0] hold;
	
	
	
	genvar i; 

	generate
	
		for(i = 0; i < 5; i++) begin: muxes
			two_one_mux a(.writeQ(in1[i]), .Qold(in0[i]), .sel(sel), .out(hold[i]));
		end
	endgenerate
	
	assign finalOutput = hold; //output of first mux
endmodule
	