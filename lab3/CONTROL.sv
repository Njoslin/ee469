module CONTROL(OPCODE, Reg2Loc, CBZBranch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, UnconditionalBranch, BranchLessThan, BranchLink, BranchRegister);
	//inustruction -- > [31:21]
	input logic [10:0] OPCODE;
	//one point outputs
	output logic Reg2Loc, CBZBranch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, UnconditionalBranch, BranchLessThan, BranchLink, BranchRegister;
	//aluSource is a 2 bit output
	output logic [1:0] ALUOp;

	/*ALUOP CONTROLS:
	load and store = 00
	cbz =01
	all r-type = 10
	-->ADD, SUB, AND, ORR
	*/
	
	always_comb begin
	//default to avoid latching
		Reg2Loc = 0;
		CBZBranch = 0;
		MemRead = 0;
		MemtoReg = 0;
		MemWrite = 0;
		ALUSrc = 0;
		RegWrite = 0;
		UnconditionalBranch = 0;
		BranchLessThan = 0;
		BranchLink = 0;
		BranchRegister = 0;
		ALUOp = 2'b00;
		
	//add instruction
		if(OPCODE == 11'b10001011000)begin
			Reg2Loc = 1'b1;
			ALUSrc = 1'b0;
			MemtoReg = 1'b0;
			MemRead = 1'b0;
			RegWrite = 1'b1;
			MemWrite = 1'b0;
			CBZBranch = 1'b0;
			ALUOp = 2'b10;
			BranchLink = 1'b0;
			UnconditionalBranch = 1'b0;
			BranchLessThan = 1'b0;
			BranchRegister = 1'b0;
		end
		
		//addi instruction
		else if(OPCODE[10:1] == 10'b1001000100)begin
			Reg2Loc = 1'b0; //good //ASK TA WHY DOES X HERE NOT WORK
			ALUSrc = 1'b1; 
			MemtoReg = 1'b0;
			MemRead = 1'b0;
			RegWrite = 1'b1;
			MemWrite = 1'b0;
			CBZBranch = 1'b0;
			ALUOp = 2'b11;
			UnconditionalBranch = 1'b0;
			BranchLessThan = 1'b0;
			BranchLink = 1'b0;
			BranchRegister = 1'b0;
			
		end
		
		//adds instructions
		//note we will set flags
		else if(OPCODE == 11'b10101011000)begin
			Reg2Loc = 1'b0;
			ALUSrc = 1'b0;
			MemtoReg = 1'b0;
			MemRead = 1'b0;
			RegWrite = 1'b1;
			MemWrite = 1'b0;
			CBZBranch = 1'b0;
			ALUOp = 2'b10;
			UnconditionalBranch = 1'b0;
			BranchLessThan = 1'b0;
			BranchLink = 1'b0;
			BranchRegister = 1'b0;
		end
		
		
	//sub instructions
		else if(OPCODE == 11'b11001011000)begin
			Reg2Loc = 1'b1;
			ALUSrc = 1'b0;
			MemtoReg = 1'b0;
			MemRead = 1'b0;
			RegWrite = 1'b1;
			MemWrite = 1'b0;
			CBZBranch = 1'b0;
			ALUOp = 2'b10;
			UnconditionalBranch = 1'b0;
			BranchLessThan = 1'b0;
			BranchLink = 1'b0;
			BranchRegister = 1'b0;
		end
		
		//subs instructions
		//note we will set flags
		else if(OPCODE == 11'b11101011000)begin
			Reg2Loc = 1'b0;
			ALUSrc = 1'b0;
			MemtoReg = 1'b0;
			MemRead = 1'b0;
			RegWrite = 1'b1;
			MemWrite = 1'b0;
			CBZBranch = 1'b0;
			ALUOp = 2'b10;
			UnconditionalBranch = 1'b0;
			BranchLessThan = 1'b0;
			BranchLink = 1'b0;
			BranchRegister = 1'b0;
		end
		
	//load 
		else if(OPCODE == 11'b11111000010)begin
			Reg2Loc = 1'b0;
			ALUSrc = 1'b1;
			MemtoReg = 1'b1;
			MemRead = 1'b1;
			RegWrite = 1'b1;
			MemWrite = 1'b0;
			CBZBranch = 1'b0;
			ALUOp = 2'b00;
			UnconditionalBranch = 1'b0;
			BranchLessThan = 1'b0;
			BranchLink = 1'b0;
			BranchRegister = 1'b0;
		end
	
	//store
		else if(OPCODE == 11'b11111000000)begin
			Reg2Loc = 1'b1;
			ALUSrc = 1'b1;
			MemtoReg = 1'b0;
			RegWrite = 1'b0;
			MemRead = 1'b0;
			MemWrite = 1'b1;
			CBZBranch = 1'b0;
			ALUOp = 2'b00;
			UnconditionalBranch = 1'b0;
			BranchLessThan = 1'b0;
			BranchLink = 1'b0;
			BranchRegister = 1'b0;
		end
	
	//B
	else if(OPCODE[10:5] == 6'b000101)begin
			Reg2Loc = 1'b0;
			ALUSrc = 1'b0;
			MemtoReg = 1'b0;
			RegWrite = 1'b0;
			MemWrite = 1'b0;
			MemRead = 1'b0;
			CBZBranch = 1'b0; //CBZ BRANCH
			ALUOp = 2'b00;
			UnconditionalBranch = 1'b1;
			BranchLessThan = 1'b0;
			BranchLink = 1'b0;
			BranchRegister = 1'b0;
		end
		
	
	//B.LT, B.cond --> conditional 
	//want to write to x30, PC + 4, PC = PC + signextend
	else if(OPCODE[10:3] == 8'b01010100)begin
			Reg2Loc = 1'b0; //maybe an issue SETTING ONE TEST
			ALUSrc = 1'b0;
			MemtoReg = 1'b0;
			RegWrite = 1'b0;
			MemWrite = 1'b0;
			MemRead = 1'b0;
			CBZBranch = 1'b0; 
			ALUOp = 2'b00;
			UnconditionalBranch = 1'b0;
			BranchLessThan = 1'b1;
			BranchLink = 1'b0;
			BranchRegister = 1'b0;
		end
		
	
	//CBZ
	else if(OPCODE[10:3] == 8'b10110100)begin
			Reg2Loc = 1'b1;
			ALUSrc = 1'b0; //pass B
			MemtoReg = 1'b0;
			RegWrite = 1'b0;
			MemWrite = 1'b0;
			MemRead = 1'b0;
			CBZBranch = 1'b1; //BRANCH IS ONE SINCE WE WANT TO PC + OFFSET
			ALUOp = 2'b01; //passing B
			UnconditionalBranch = 1'b0;
			BranchLessThan = 1'b0;
			BranchLink = 1'b0;
			BranchRegister = 1'b0;
		end
		
		//branch link
			else if(OPCODE[10:5] == 6'b100101)begin
			Reg2Loc = 1'b0;
			ALUSrc = 1'b0;
			MemtoReg = 1'b0;
			RegWrite = 1'b1;
			MemWrite = 1'b0;
			MemRead = 1'b0;
			CBZBranch = 1'b0; //CBZ BRANCH
			ALUOp = 2'b00;
			UnconditionalBranch = 1'b0;
			BranchLessThan = 1'b0;
			BranchLink = 1'b1;
			BranchRegister = 1'b0;
		end
		
		//branch register
			else if(OPCODE[10:0] == 11'b11010110000)begin
			Reg2Loc = 1'b1;
			ALUSrc = 1'b0;
			MemtoReg = 1'b0;
			RegWrite = 1'b0;
			MemWrite = 1'b0;
			MemRead = 1'b0;
			CBZBranch = 1'b0; //CBZ BRANCH
			ALUOp = 2'b00;
			UnconditionalBranch = 1'b0;
			BranchLessThan = 1'b0;
			BranchLink = 1'b0;
			BranchRegister = 1'b1;
		end
	end
	
endmodule

	
	