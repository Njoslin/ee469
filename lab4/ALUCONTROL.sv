`timescale 1ns/10ps
module ALUCONTROL(opcode, ALUOp, aluoperation);
	input logic [10:0] opcode; //selected bits from the instruction memory/particular fields
	input logic [1:0] ALUOp; //control from the control unit
	output logic [2:0] aluoperation;
	

	always_comb begin
		//default case
		aluoperation = 3'bxxx;
	
		//opcode = x
		//if instruction is load or store
		if(ALUOp == 2'b00)begin
			aluoperation = 3'b010;
		end
		
		//if CBZ
		else if(ALUOp == 2'b01)begin
			aluoperation = 3'b000; //pass B
		end
		
		
		//R-type instructions
		else if(ALUOp == 2'b10)begin
			//for ADD
			if(opcode == 11'b10001011000)begin
				aluoperation = 3'b010;
			end
			
			//for adds
			else if(opcode == 11'b10101011000)begin
				aluoperation = 3'b010;
			end
			
			//subs
			else if(opcode == 11'b11101011000)begin
				aluoperation = 3'b011;
			end
			
				//for SUB instructions
			else if(opcode == 11'b11001011000)begin
				aluoperation = 3'b011;
			end
					//for AND
			else if(opcode == 11'b10001010000)begin
				aluoperation = 3'b100;
			end
			//for ORR
			else if(opcode == 11'b10101010000)begin
				aluoperation = 3'b101;
			end
		end
		
		//i-type instructions for addi
		else if(ALUOp == 2'b11)begin
			if(opcode[10:1] == 10'b1001000100)begin
				aluoperation = 3'b010;
			end
		end
	end
endmodule
		
						
						
						
				
		