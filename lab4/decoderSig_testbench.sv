`timescale 1ns/10ps
module decoderSig_testbench;
	 logic [31:0] instructions;
	 logic [1:0] mux_src; 
	 
	 initial begin
		instructions = 32'b10110100111111111111111110101100; #1000; //11
		instructions = 32'b10010001000000001000110001101000; #1000; //00
		instructions = 32'b11111000010000001100000000000011; #1000; //01
		
	end
	
	decoderForSignExten dut(.instructions(instructions), .mux_src(mux_src));
endmodule

		
		
	 
	 
	