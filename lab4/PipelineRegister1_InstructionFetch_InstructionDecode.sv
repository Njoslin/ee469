module PipelineRegister1_InstructionFetch_InstructionDecode(reset, clk, enable, IF_1_pc, IF_1_instruction, ID_2_pc, ID_2_instruction,
IF_1_pcPlusFour, ID_2_pcPlusFour);
		input logic reset, clk, enable;
	
	//IF HALF
	input logic [63:0] IF_1_pc; //pc for the pc + sign extend
	input logic [63:0]IF_1_pcPlusFour; //pc for BranchLink
	input logic [31:0] IF_1_instruction; //instruction
	
	//ID HALF
	output logic [63:0] ID_2_pc; //pc for the pc + sign extend
	output logic [63:0] ID_2_pcPlusFour; //pc for BranchLink
	output logic [31:0] ID_2_instruction; //instruction
	
	
	//Instruction Fetch --> Instruction Decode for pc. input will come from PC output
	Uni_Enable_DFF #(.WIDTH(64)) ProgramCounter_PlusFour_IF_ID(.clk(clk), .reset(reset), .enable(enable),
	.writeData(IF_1_pcPlusFour), .q(ID_2_pcPlusFour));
	
	//pc + 4 for branchlink
	Uni_Enable_DFF #(.WIDTH(64)) ProgramCounter_IF_ID(.clk(clk), .reset(reset), .enable(enable),
	.writeData(IF_1_pc), .q(ID_2_pc));
	
	//Instruction Fetch --> Instruction Decode for instruction input will come from ROM output
	Uni_Enable_DFF #(.WIDTH(32)) Instruction_IF_ID(.clk(clk), .reset(reset), .enable(enable),
	.writeData(IF_1_instruction), .q(ID_2_instruction));
	
endmodule

	