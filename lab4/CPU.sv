`timescale 1ns/10ps
module CPU(reset, clk);
	input logic reset, clk;
	/* pcInput = input to the pc counter
		PCOUT = wire that carries the output of pc into the read address of instruction mem
		sequentialInstructionUpdate = wire for pc + 4, sequentialInstructionUpdate
		shiftINSTRUCTIONUPDATE = PC + baseAddress
		normalWriteDataInput and WriteDataInput = HOLDER FOR OUTPUT OF MUX FROM MEM TO REG
		ReadData1/ReadData2 == wires for the output of the register files
		sign_extended == wire for the sign extension
		secondALUInput == second input for the ALU
		ALURESULT == result of alu operation
		ReadDataMemory == output of data memory
		shiftedOffset == shifted value into mux4
		
		
		----NEW ADDITIONS FOR PIPELINING----
		logic enable
		
		
	********************************INSTANTIATIONS AND PORTS BELOW*******************************
	*/
	logic [63:0] pcInput, PCOUT, sequentialInstructionUpdate, shiftedInstructionUpdate, WriteDataInput, normalWriteDataInput, ReadData1, ReadData2,
	sign_extended, secondALUInput, ALURESULT, ReadDataMemory, shiftedOffset;
	
	//wire for the output of the isntruction memory, this is the actually instructions, opcode etc
	logic [31:0] INSTRUCTION;
	
	//REG2LOCATION == output or the input from the readRegister2Mux into the regfile
	//selectedRegister == logic for selected register for BranchLink
	logic [4:0] REG2LOCATION, selectedRegister;
	
	//alu control from the ALU Control Unit
	logic [2:0] ALUOPERATION;
	
	//2 bit output for the ALUOp from the control 
	//pc selection via branching choice
	logic [1:0] ALUOp;
	
	logic pcsel;
	
	//carryout for plus4Adder and plusSignExtended added
	logic carryOut1, carryOut2;
	
	//logic for the control outputs
	logic Reg2Loc, CBZBranch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, 
	UnconditionalBranch, BranchLessThan, BranchLink, BranchRegister;
	
	//alu flag outputs
	logic negative, zero, overflow, carry_out;
	
	//flag register output flags
	logic is_neg, is_zero, is_over, carry_o;
	
	logic zeroCBZ;
	
	//logic for branch + 4 or not
	logic branchEitherPlus4OrOffset, cbzTaken, bltTaken;
	
	
	logic [63:0] pcsel_UC_B;

	//holder wires for the output of the first Pipeline register
	logic [63:0] ID_2_pcout;
	
	logic [63:0] ID_2_pcPlusFour, EX_3_pcPlus4, MEM_4_pcPlus4;
	
	logic [31:0] ID_2_instruction;
	
	logic [4:0] EX_3_reg_Address, MEM_4_red_Address, MEM_WB_Instruction_Address;
	
	
	logic EX_3_MemRead, EX_3_MemtoReg, EX_3_MemWrite, EX_3_ALUSrc, EX_3_RegWrite, EX_3_BranchLink,
	
	MEM_4_CBZBranch, MEM_4_MemRead, MEM_4_MemtoReg, MEM_4_MemWrite, MEM_4_ALUSrc, MEM_4_RegWrite, 
	
   MEM_4_BranchLink, MEM_4_BranchRegister;
	
	logic [1:0] EX_3_ALUOp;
	
	
	
	logic [63:0] EX_3_signExtend, MEM_4_pcPlusSignExtend;  
	
	logic [63:0] MEM_4_ALUResult;
	
	logic [63:0] EX_3_ReadData1, EX_3_ReadData2, MEM_4_ReadData2;
	
	logic [10:0] EX_3_OPCODE;
	
	
	logic MEM_WB_BranchLink;
	
	
	logic [63:0] WB_5_ReadDataMemory, WB_5_ALUResult, WB_5_pcPlus4;
	
	logic WB_5_MemtoReg;
	
	logic WB_5_RegWrite;
	
	logic [63:0] BR_Select, CBZ_Select;
	
	logic [63:0] STUR_1_WriteData, STUR_2_ReadData;
	
	logic STUR_1, CBZForward;
	
	
//**********************************************************************************************
	
	//We want the IF PC + 4 "sequentialInstructionUpdate", and PC + SignExtend from ID "shiftedInstructionUpdate" !
	//GOOD!
	two_to_one_64mux MUXSELECTBRANCH(.in0(sequentialInstructionUpdate), .in1(shiftedInstructionUpdate), .sel(pcsel), .finalOutput(pcsel_UC_B));
	
	//Since all branching is in ID stage, we want to grad the ReadData2 from ID and BranchRegister Signal from ID!
	//GOOD!
	two_to_one_64mux MUXSELECTPC(.in0(pcsel_UC_B), .in1(BR_Select), .sel(BranchRegister), .finalOutput(pcInput));
	
	//GOOD!
	PC programCounter(.inPC(pcInput), .outPC(PCOUT), .clk(clk), .reset(reset), .enable(1'b1));
	
	//GOOD!
	basic64BitAdder plus4Adder(.a(PCOUT), .b(64'b0000000000000000000000000000000000000000000000000000000000000100),
	.result(sequentialInstructionUpdate), .cin(1'b0), .cout(carryOut1));
	
	//GOOD!
	instructmem instructionMemory(.address(PCOUT), .instruction(INSTRUCTION), .clk(clk));
	
	
	//NOTE: PCOUT = pc
	//GOOD!
	PipelineRegister1_InstructionFetch_InstructionDecode PP1(.reset(reset), .clk(clk), .enable(1'b1), 
	
	.IF_1_pc(PCOUT), .IF_1_instruction(INSTRUCTION), .IF_1_pcPlusFour(sequentialInstructionUpdate),
	
	.ID_2_pc(ID_2_pcout), .ID_2_instruction(ID_2_instruction), .ID_2_pcPlusFour(ID_2_pcPlusFour));

	
	//GOOD!
	CONTROL control(.OPCODE(ID_2_instruction[31:21]), .Reg2Loc(Reg2Loc), .CBZBranch(CBZBranch), 
	
	.MemRead(MemRead), .MemtoReg(MemtoReg), .MemWrite(MemWrite), .ALUSrc(ALUSrc), .RegWrite(RegWrite),
	
	.ALUOp(ALUOp), .UnconditionalBranch(UnconditionalBranch), .BranchLessThan(BranchLessThan), .BranchLink(BranchLink), .BranchRegister(BranchRegister));
	
	//GOOD!
	signextension SignExtension(.instructions(ID_2_instruction), .out(sign_extended));

	//GOOD!
	shifter shiftby4(.value(sign_extended), .direction(1'b0), .distance(6'b000010), .result(shiftedOffset));
	
	//GOOD!
	basic64BitAdder pcPLUSsignextend(.a(ID_2_pcout), .b(shiftedOffset), .result(shiftedInstructionUpdate), .cin(1'b0), .cout(carryOut2));
	
	//GOOD!
	readRegister2Mux ReadRegister2MUX(.loadTypeField(ID_2_instruction[20:16]), .otherTypeField(ID_2_instruction[4:0]), .reg2Selection(REG2LOCATION), .sel(Reg2Loc));
	
	
	//BranchLink Signal from stage5
	//BranchLink value from stage 5, PC + 4 (store next instruction relative to current instruction
	//GOOD!
	two_to_one_writeRegisterMux branchLinkRegisterMux(.in0(MEM_WB_Instruction_Address), .in1(5'b11110), 
	
	.sel(MEM_WB_BranchLink), .finalOutput(selectedRegister));
	
	
	//Mux selects the output of either the (ALU Result or ReadData from Data Memory) or PC + 4 for BranchLink
	//Therefore, we need to use WB_5_BranchLink Signal and WB_5_PCPLUS4 signal
	//GOOD!
	two_to_one_64mux MUXFIVE(.in0(normalWriteDataInput), .in1(WB_5_pcPlus4), .sel(MEM_WB_BranchLink), .finalOutput(WriteDataInput));
	
	
	//NOTE: We input WB_5_RegWrite b/c we onyl want to write to the register in the WB stage
	//Hence the name, "Write Back Stage".
	//GOOD!
	regfile RegisterFile(.ReadRegister1(ID_2_instruction[9:5]), .ReadRegister2(REG2LOCATION), .WriteRegister(selectedRegister), .WriteData(WriteDataInput),
	
	.RegWrite(WB_5_RegWrite), .ReadData1(ReadData1), .ReadData2(ReadData2), .clk(~clk));
	
	
	two_to_one_64mux CBZ_Forward_MUX(.in0(ReadData2), .in1(ALURESULT), .sel(CBZForward), .finalOutput(CBZ_Select));
	
	//Zero Check for CBZ
	//GOOD!
	zero ZEROCHECK(.zr(CBZ_Select), .zeroFlag(zeroCBZ));
	
	
	//Checking if current Register is zero AND that we are taking a CBZBranch
	assign cbzTaken = zeroCBZ && CBZBranch;
	
	//set the next pcsel for either sequential or shifted instruction update
	always_comb begin
		pcsel = 2'b0;
		//if unconditional or conditional, pc = pc + address (sign extend)
		if(cbzTaken || bltTaken || BranchLink || UnconditionalBranch) begin
			pcsel = 2'b1;
		end
	end

	
	
	//IF/ID Register.RM/RN come directly from the inputs to the Read Register 1/2 for the RegFile
	logic [4:0] IF_ID_Register_Rm, IF_ID_Register_Rn; 
	
	//Outputs of the second pipeline into the Forwarding unit!
	logic [4:0] INTO_IF_ID_Register_Rm, INTO_IF_ID_Register_Rn;
	
	
	/*
	KEY INPUTS FOR FOWARDING
	-Instruction Address 4:0
	-IF/ID Register.Rm 
	-IF/ID Register.Rn 
	*/
	
	//ID_2 are inputs to the ID/EX register
	//EX_3 are outputs to the ID/EX register
	
	//GOOD!
	PipelineRegister2_InstructionDecode_Execution PPR2(.clk(clk), .reset(reset), .enable(1'b1), .ID_2_ReadData1(ReadData1), .ID_2_ReadData2(ReadData2), 
	
	.ID_2_Immediate(sign_extended), .ID_2_instruc_OPCODE(ID_2_instruction[31:21]), .ID_2_reg_Address(ID_2_instruction[4:0]), 
	
	.ID_2_MemRead(MemRead), .ID_2_MemtoReg(MemtoReg), .ID_2_MemWrite(MemWrite), .ID_2_ALUSrc(ALUSrc), .ID_2_RegWrite(RegWrite), 
	
   .ID_2_BranchLink(BranchLink), .ID_2_pcPlusFour(ID_2_pcPlusFour), .ID_2_ALUOp(ALUOp),
	
   .EX_3_ReadData1(EX_3_ReadData1), .EX_3_ReadData2(EX_3_ReadData2), .EX_3_Immediate(EX_3_signExtend), 
	
	.EX_3_instruc_OPCODE(EX_3_OPCODE), .EX_3_reg_Address(EX_3_reg_Address), 
	
   .EX_3_MemRead(EX_3_MemRead), .EX_3_MemtoReg(EX_3_MemtoReg), .EX_3_MemWrite(EX_3_MemWrite), .EX_3_ALUSrc(EX_3_ALUSrc), 
	
	.EX_3_RegWrite(EX_3_RegWrite),.EX_3_BranchLink(EX_3_BranchLink), 
	
   .EX_3_ALUOp(EX_3_ALUOp), .EX_3_pcPlusFour(EX_3_pcPlus4), .IF_ID_Register_Rm(REG2LOCATION), .IF_ID_Register_Rn(ID_2_instruction[9:5]), 
	
	.INTO_IF_ID_Register_Rm(INTO_IF_ID_Register_Rm), .INTO_IF_ID_Register_Rn(INTO_IF_ID_Register_Rn));

	
	
	//FORWARDING
	logic [63:0] Forward_A_output, Forward_B_output;
	
	logic [1:0] forwardA, forwardB;
	
	logic [1:0] BR_forward;
	
	logic SturForwardForReadData;
	
	logic overflowSelect, negativeSelect, trueOverflow, trueNegative;
	
	two_to_one_64mux MUXTWO(.in0(Forward_B_output), .in1(EX_3_signExtend), .sel(EX_3_ALUSrc), .finalOutput(secondALUInput));
	
	ALUCONTROL aluCONTROL(.opcode(EX_3_OPCODE), .ALUOp(EX_3_ALUOp), .aluoperation(ALUOPERATION));
	
	
	FORWARDING FORWARD_UNIT(.INTO_IF_ID_Register_Rm(INTO_IF_ID_Register_Rm), .INTO_IF_ID_Register_Rn(INTO_IF_ID_Register_Rn), .EX_MEM_Register_Rd(MEM_4_red_Address), 
	
	.MEM_WB_Instruction_Address(MEM_WB_Instruction_Address), .MEM_4_RegWrite(MEM_4_RegWrite), .WB_5_RegWrite(WB_5_RegWrite), .Forward_A(forwardA), .Forward_B(forwardB),
	
	.IF_ID_OPCODE_B(ID_2_instruction[31:21]), .ID_EX_OPCODE_S(EX_3_OPCODE), .overflowForward(overflowSelect), .negativeForward(negativeSelect),
	
	.branchRegister(BranchRegister), .BR_Forward(BR_forward), .ID_EX_Register_Rd(EX_3_reg_Address), 
	
	.IF_ID_Register_Rd(ID_2_instruction[4:0]), .ID_EX_RegWrite(EX_3_RegWrite), .EX_MEM_MemWrite(MEM_4_MemWrite), .STUR_1_RAW(STUR_1), .CBZ_Forward(CBZForward), .cbzBranch(CBZBranch),
	
	.WB_5_MemtoReg(WB_5_MemtoReg), .ID_EX_MemWrite(EX_3_MemWrite), .EX_MEM_MemtoReg(MEM_4_MemtoReg), .forwardSturForReadData(SturForwardForReadData));
	
	
	
	//FOWARDING MUXES
	four_to_one_64mux FORWARD_A(.in0(EX_3_ReadData1), .in1(normalWriteDataInput), .in2(MEM_4_ALUResult), .sel(forwardA), .finalOutput(Forward_A_output));
	
	four_to_one_64mux FORWARD_B(.in0(EX_3_ReadData2), .in1(normalWriteDataInput), .in2(MEM_4_ALUResult), .sel(forwardB), .finalOutput(Forward_B_output));
	
	
	alu ALU(.A(Forward_A_output), .B(secondALUInput), .cntrl(ALUOPERATION), .result(ALURESULT), .negative(negative), .carry_out(carry_out), 
	
	.overflow(overflow), .zero(zero));
	
		//stur 2 mux
	two_to_one_64mux STUR2_HAZARD_MUX(.in0(EX_3_ReadData2), .in1(WB_5_ALUResult), .sel(SturForwardForReadData), .finalOutput(STUR_2_ReadData));
	
	//stur mux
	two_to_one_64mux STUR_1_HAZARD_MUX(.in0(MEM_4_ReadData2), .in1(normalWriteDataInput), .sel(STUR_1), .finalOutput(STUR_1_WriteData));
	
	
	//branch forward
	four_to_one_64mux BR_Forward_MUX(.in0(ReadData2), .in1(ALURESULT), .in2(ReadDataMemory), .sel(BR_forward), .finalOutput(BR_Select));
	

	
	
	
	
	//Flag Register takes in the opcode of the current instruction. 
	//This OPCODE also acts as our enable to clear and add new flags!
	//GOOD!
	flag_register FLAGREGISTER(.negative(negative), .overflow(overflow), .zero(zero), .carry_out(carry_out), 
	
	.is_neg(is_neg), .is_over(is_over), .is_zero(is_zero), .carry_o(carry_o), .clk(clk), .reset(reset), .opcode(EX_3_OPCODE));
	
	
	two_one_mux negativeMux(.Qold(is_neg), .writeQ(negative), .sel(negativeSelect), .out(trueNegative));
	two_one_mux overflowMux(.Qold(is_over), .writeQ(overflow), .sel(overflowSelect), .out(trueOverflow));
	
	//Flags come from the output of the flag register in the EX Stage!
	//GOOD!
	assign bltTaken = (trueNegative != trueOverflow) && BranchLessThan;
	
	
	//PIPELINE REGISTER 3
	//GOOD!
	PipelineRegister3_Execution_MemoryAccess PPR3(.clk(clk), .reset(reset), .enable(1'b1), .EX_3_MemRead(EX_3_MemRead),
	
	.EX_3_MemtoReg(EX_3_MemtoReg), .EX_3_MemWrite(EX_3_MemWrite), .EX_3_RegWrite(EX_3_RegWrite), .EX_3_BranchLink(EX_3_BranchLink),

   .MEM_4_MemRead(MEM_4_MemRead), .MEM_4_MemtoReg(MEM_4_MemtoReg), .MEM_4_MemWrite(MEM_4_MemWrite), .MEM_4_RegWrite(MEM_4_RegWrite), 

	.MEM_4_BranchLink(MEM_4_BranchLink), .EX_3_ALUResult(ALURESULT), .MEM_4_ALUResult(MEM_4_ALUResult), .EX_3_reg_Address(EX_3_reg_Address), 
	
	.MEM_4_reg_Address(MEM_4_red_Address), .EX_3_pcPlusFour(EX_3_pcPlus4), .MEM_4_pcPlusFour(MEM_4_pcPlus4), 
	
	.EX_3_ReadData2(STUR_2_ReadData), .MEM_4_ReadData2(MEM_4_ReadData2));
	
	
	//GOOD!
	datamem MEMORY(.address(MEM_4_ALUResult), .write_data(STUR_1_WriteData), .write_enable(MEM_4_MemWrite), 
	
	.read_enable(MEM_4_MemRead), .read_data(ReadDataMemory), .xfer_size(4'b1000), .clk(clk));
	
	
	//STAGE 5
	//GOOD!
	PipelineRegister4_MemoryAccess_WriteBack PPR4(.reset(reset), .clk(clk), .enable(1'b1), .MEM_4_ReadDataMemory(ReadDataMemory), .WB_5_ReadDataMemory(WB_5_ReadDataMemory), 
	
	.MEM_4_ALUResult(MEM_4_ALUResult), .WB_5_ALUResult(WB_5_ALUResult), .MEM_4_reg_Address(MEM_4_red_Address), .WB_5_reg_Address(MEM_WB_Instruction_Address), 
	
	.MEM_4_MemtoReg(MEM_4_MemtoReg) , .MEM_4_RegWrite(MEM_4_RegWrite), .MEM_4_BranchLink(MEM_4_BranchLink), .WB_5_MemtoReg(WB_5_MemtoReg), .WB_5_RegWrite(WB_5_RegWrite), 
	
	.WB_5_BranchLink(MEM_WB_BranchLink), .MEM_4_pcPlus4(MEM_4_pcPlus4), .WB_5_pcPlus4(WB_5_pcPlus4));
	
	//Mux to select ALU or read the data from memory. 
	//This will go into the write data input to the regfile.
	//GOOD!
	two_to_one_64mux MUXTHREE(.in0(WB_5_ALUResult), .in1(WB_5_ReadDataMemory), .sel(WB_5_MemtoReg), .finalOutput(normalWriteDataInput));
	
endmodule
	
	
	
	
	
	
	
	