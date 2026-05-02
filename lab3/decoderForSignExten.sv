`timescale 1ns/10ps
module decoderForSignExten(instructions,mux_src);
	input logic [31:0] instructions;
	output logic [1:0] mux_src; 
	
	/*
	i_type = 00
	d_type = 01
	b_type = 10
	cb_type = 11
	*/
	logic [9:0]i_opcode;
	logic [10:0] d_opcode;
	logic [7:0] cb_opcode;
	logic [5:0] b_opcode;
	
	assign i_opcode = instructions[31:22];
	assign d_opcode = instructions[31:21];
	assign cb_opcode = instructions[31:24]; //8 bit
	assign b_opcode = instructions[31:26]; //6 bits
	
	//rtl logic
	
	always_comb begin
		//10 bits
		//i_type, using masking to grab the important bits
		//checking for 
		if(i_opcode == 10'b1001000100)begin
			 mux_src = 2'b00;
		end
	//11 bits
		//d_type, first checking isLDUR
		else if(d_opcode == 11'b11111000010)begin
			mux_src = 2'b01;
		end
			//then isSTUR
		else if(d_opcode == 11'b11111000000)begin
			mux_src = 2'b01;
		end
			
			
		//6 bits
		//b_type, first checking isB //then isBL
		else if(b_opcode == 6'b000101 || b_opcode == 6'b100101) begin
			 mux_src = 2'b10;
		end
		
		
		//cb_type, first checkingisCBZ then isBLT
		else if(cb_opcode == 8'b10110100 || cb_opcode == 8'b01010100) begin
			 mux_src = 2'b11;
		end
		
		//if we dont get any of these instructions, it can assumed we wont be using sign ex.
		else begin
			mux_src = 2'b00;
		end
		
	end
endmodule 
	
	