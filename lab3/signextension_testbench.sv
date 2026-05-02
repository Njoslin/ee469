`timescale 1ns/10ps
module signextension_testbench;
	 logic [31:0] instructions;
	 logic [63:0] out;
	
	 /*
	i_type = 00
	d_type = 01
	b_type = 10
	cb_type = 11
	
	 
	 [11:0] i_type; 		00
	 [8:0] d_type; 		01
	 [25:0] b_type; 		10
	 [18:0] cb_type; 		11
	 
	 i_type = instructions[21:10];  00
	 d_type = instructions[20:12];  01
	 b_type = instructions[25:0];   10
	 cb_type = instructions[23:5];  11
	*/
	 initial begin //    
		instructions = 32'b10110100111111111111111110101100; #1000; //11 
		instructions = 32'b10010001000000001000110001101000; #1000; //00 
		
		instructions = 32'b11111000010000001100000000000011; #1000; //01
		
	end
	
	signextension dut(.instructions(instructions), .out(out));
	
endmodule


	
	 
	 
	
	 
	