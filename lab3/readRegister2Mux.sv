`timescale 1ns/10ps
module readRegister2Mux(loadTypeField, otherTypeField, reg2Selection, sel);
	// 5-bit 2:1 MUX for choosing register 2 source
	// If sel == 0: choose loadTypeField (bits 20–16, for LDUR/STUR)
	// If sel == 1: choose otherTypeField (bits 4–0, for R-type)
	input logic [4:0] loadTypeField, otherTypeField;
	input logic sel;
	
	output logic [4:0] reg2Selection;
	
	//hold the output of the mux
	logic [4:0] hold;
	
	genvar i; 

	generate
	
		for(i = 0; i < 5; i++) begin: muxes
			two_one_mux a(.writeQ(otherTypeField[i]), .Qold(loadTypeField[i]), .sel(sel), .out(hold[i]));
		end
	endgenerate
	
	assign reg2Selection = hold; //output of first mux
endmodule
