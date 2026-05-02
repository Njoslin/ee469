module FORWARDING(INTO_IF_ID_Register_Rm, INTO_IF_ID_Register_Rn, EX_MEM_Register_Rd, MEM_WB_Instruction_Address, MEM_4_RegWrite, WB_5_RegWrite, 
Forward_A, Forward_B, IF_ID_OPCODE_B, ID_EX_OPCODE_S, overflowForward, negativeForward, branchRegister, BR_Forward, ID_EX_Register_Rd,
IF_ID_Register_Rd, ID_EX_RegWrite, EX_MEM_MemWrite, STUR_1_RAW, CBZ_Forward, cbzBranch, WB_5_MemtoReg, ID_EX_MemWrite, EX_MEM_MemtoReg, forwardSturForReadData);
	
	
	//notes that INTO is ID/EX registers
	input logic [4:0]INTO_IF_ID_Register_Rm, INTO_IF_ID_Register_Rn; //from the read Register input to the register
	input logic [4:0] IF_ID_Register_Rd, ID_EX_Register_Rd, EX_MEM_Register_Rd, MEM_WB_Instruction_Address;
	input logic ID_EX_RegWrite, MEM_4_RegWrite, WB_5_RegWrite, EX_MEM_MemWrite, WB_5_MemtoReg, ID_EX_MemWrite, EX_MEM_MemtoReg;
	
	input logic branchRegister, cbzBranch;
	
	
	
	
	input logic [10:0] IF_ID_OPCODE_B, ID_EX_OPCODE_S;
	
	
	output logic [1:0] Forward_A, Forward_B;
	
	output logic overflowForward, negativeForward;
	
	output logic STUR_1_RAW, CBZ_Forward, forwardSturForReadData;
	
	output logic [1:0] BR_Forward;

	
	logic [10:0] ADDS, SUBS;
	logic [7:0] BranchLessThan;
	assign ADDS = 11'b10101011000;
	assign SUBS = 11'b11101011000;
	assign BranchLessThan = 8'b01010100;
	
		always_comb begin
		  Forward_A = 2'b00; // default: no forwarding
        Forward_B = 2'b00;
		  overflowForward = 1'b0;
		  negativeForward = 1'b0;
		  BR_Forward = 2'b00;
		  STUR_1_RAW = 1'b0;
		  CBZ_Forward = 1'b0;
		  
		 
			//case 1
			if(MEM_4_RegWrite && EX_MEM_Register_Rd != 5'b11111 && EX_MEM_Register_Rd == INTO_IF_ID_Register_Rn) begin
				 Forward_A = 2'b10;
			end
			
		    if(MEM_4_RegWrite && EX_MEM_Register_Rd != 5'b11111 && EX_MEM_Register_Rd == INTO_IF_ID_Register_Rm) begin
				 Forward_B = 2'b10;
			end
			
			
			//case 2
		    if((WB_5_RegWrite && (MEM_WB_Instruction_Address != 5'b11111) 
			
			&& (~(MEM_4_RegWrite && (EX_MEM_Register_Rd != 5'b11111) && (EX_MEM_Register_Rd == INTO_IF_ID_Register_Rn))) 
			
			&& (MEM_WB_Instruction_Address == INTO_IF_ID_Register_Rn))) begin
			
				 Forward_A = 2'b01;
			end
			
		    if(WB_5_RegWrite && (MEM_WB_Instruction_Address != 5'b11111) 
			 
			
			&& (~(MEM_4_RegWrite && (EX_MEM_Register_Rd != 5'b11111) && (EX_MEM_Register_Rd == INTO_IF_ID_Register_Rm)))
			
			&& (MEM_WB_Instruction_Address == INTO_IF_ID_Register_Rm)) begin
			
				 Forward_B = 2'b01;
			end
			
			
			
			
			//for B.LT
		 if(MEM_4_RegWrite && (ID_EX_OPCODE_S == ADDS || ID_EX_OPCODE_S == SUBS) && 
			  (BranchLessThan == IF_ID_OPCODE_B[10:3])) begin
			   overflowForward = 1'b1; //forward these flags
				negativeForward = 1'b1;
		end
			
			//for branch register, one after the other instruction
			 if((branchRegister && ID_EX_Register_Rd != 5'b11111 && ID_EX_RegWrite) 
			
			&& (ID_EX_Register_Rd == IF_ID_Register_Rd)) begin
			
					BR_Forward = 2'b01;
		end
		
		//BR #2
		 if((branchRegister && EX_MEM_Register_Rd != 5'b11111 && MEM_4_RegWrite) 
			
			&& (IF_ID_Register_Rd == EX_MEM_Register_Rd)) begin
			
					BR_Forward = 2'b10;
		
		end
		
		
		
		//RAWHAZARDS
		 else if(EX_MEM_MemWrite &&  (WB_5_RegWrite && MEM_WB_Instruction_Address != 5'b11111)
		  
		  &&(MEM_WB_Instruction_Address == EX_MEM_Register_Rd))begin
		  
				STUR_1_RAW = 1'b1;
				
			end
			
			
		//STUR HAZARD #2 MEM TO EX
		 else if(MEM_4_RegWrite && (EX_MEM_Register_Rd != 5'b11111 && ID_EX_MemWrite)
		
		&& (INTO_IF_ID_Register_Rn == EX_MEM_Register_Rd)) begin
		
			Forward_A = 2'b10;
		
		end
		
		
		//STUR HAZARD #3 WB TO EX
		else if(WB_5_RegWrite && (MEM_WB_Instruction_Address != 5'b11111 && ID_EX_MemWrite)
		
		&& (INTO_IF_ID_Register_Rn == MEM_WB_Instruction_Address)) begin
		
			Forward_A = 2'b01;
		
		end
		
		
	
		
		 //cbz hazard
		 if(ID_EX_RegWrite && (ID_EX_Register_Rd != 5'b11111 && cbzBranch) 
		 
		 &&(ID_EX_Register_Rd == IF_ID_Register_Rd)) begin
		 
			CBZ_Forward = 1'b1;
		end
		
		//LDUR #1
		else if(((WB_5_RegWrite && WB_5_MemtoReg) && (ID_EX_RegWrite) && (MEM_WB_Instruction_Address != 5'b11111) 
		
		&&(MEM_WB_Instruction_Address == INTO_IF_ID_Register_Rn)))begin
			
			Forward_A = 2'b01;
		end
	end
	
	

	always_comb begin
		forwardSturForReadData = 1'b0;
		
		if(WB_5_RegWrite && (MEM_WB_Instruction_Address != 5'b11111 && ID_EX_MemWrite) 
		
		&& (ID_EX_Register_Rd == MEM_WB_Instruction_Address)) begin
			
			forwardSturForReadData = 1'b1;
		
		end
	
	end
		
endmodule
	
	
	
	
	
