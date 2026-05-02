`timescale 1ns/10ps
module flag_register(negative, overflow, zero, carry_out, is_neg, is_over, is_zero, carry_o, clk, reset, opcode);


	input logic negative, overflow, zero, carry_out;
	
	input logic clk, reset;
	input logic [10:0] opcode; //input to enable change of flags or not
	output logic is_neg, is_over, is_zero, carry_o;
	logic [3:0] flag_input ;//inputs to the enable d_ff
	logic [3:0] flag_output ; //holds the individula flag signals
	
	//enable if adds or subs
	logic enable; 
	
	assign flag_input = {overflow, carry_out, negative, zero};
	
	assign is_over = flag_output[3];
	assign carry_o = flag_output[2];
	assign is_neg = flag_output[1];
	assign is_zero = flag_output[0];
	
	//set new flags if we see adds or subs
	//if en = 0, output old data, if en = 1, output new written data 
	//first is adds second is subs
	assign enable = (opcode == 11'b10001011000 || opcode == 11'b11101011000);
		

	genvar i; 
	
	generate
	
		for(i = 0; i < 4; i++)begin : eachDff
		
			enable_dff enableInst(.clk(clk), .writeData(flag_input[i]), .q(flag_output[i]), .reset(reset), .enable(enable));
			
			end
			
		endgenerate
		
	endmodule
	