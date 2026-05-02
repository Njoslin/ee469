`timescale 1ns/10ps
module alucontrol_testbench;
	 logic [10:0] opcode; //selected bits from the instruction memory/particular fields
	 logic [1:0] ALUOp; //control from the control unit
	 
	 //output
	 logic [2:0] aluControlInput;
	 
	 initial begin
		ALUOp = 2'b00; opcode = 11'b11111111000; #1000; //add --> 010
		ALUOp = 2'b01; opcode = 11'b11111111000; #1000; //pass --> 000
		//r-type
		ALUOp = 2'b10; opcode = 11'b10001011000; #1000; //add --> 010
		ALUOp = 2'b10; opcode = 11'b11001011000; #1000; //sub --> 011
		ALUOp = 2'b10; opcode = 11'b10001010000; #1000; //and --> 100
		ALUOp = 2'b10; opcode = 11'b10101010000; #1000; //or --> 101
	end
	
		ALUCONTROL dut(.opcode(opcode), .ALUOp(ALUOp), .aluControlInput(aluControlInput));
	
endmodule
		
	 
	