module PipelineRegister4_MemoryAccess_WriteBack(reset, clk, enable, MEM_4_ReadDataMemory, WB_5_ReadDataMemory, MEM_4_ALUResult, WB_5_ALUResult,
MEM_4_reg_Address, WB_5_reg_Address, MEM_4_MemtoReg, MEM_4_RegWrite, MEM_4_BranchLink, WB_5_MemtoReg, WB_5_RegWrite, WB_5_BranchLink,
MEM_4_pcPlus4, WB_5_pcPlus4);
	
	input logic reset, clk, enable;
	
	input logic [63:0] MEM_4_ReadDataMemory;
	output logic [63:0] WB_5_ReadDataMemory;
	
	//pc + 4 for branchLink
	input logic [63:0] MEM_4_pcPlus4;
	output logic [63:0] WB_5_pcPlus4;
	
	//ALU result carried into the pipeline 4
	//will go into a 2-1 mux controlled by MemToReg
	input logic [63:0] MEM_4_ALUResult;
	output logic [63:0] WB_5_ALUResult;
	
	//register address via instruction field Rd/Rt --> [4:0]
	input logic [4:0] MEM_4_reg_Address;
	output logic [4:0] WB_5_reg_Address;
	
	//add controls 
	//memtoreg, regwrite
	
	input logic MEM_4_MemtoReg, MEM_4_RegWrite, MEM_4_BranchLink;
	output logic WB_5_MemtoReg, WB_5_RegWrite, WB_5_BranchLink;


//MemtoReg
Uni_Enable_DFF #(.WIDTH(1)) MemtoReg_EX_MEM(.clk(clk), .reset(reset), .enable(enable),
.writeData(MEM_4_MemtoReg), .q(WB_5_MemtoReg));

//RegWrite
Uni_Enable_DFF #(.WIDTH(1)) RegWrite_EX_MEM(.clk(clk), .reset(reset), .enable(enable),
.writeData(MEM_4_RegWrite), .q(WB_5_RegWrite));

//BranchLink
Uni_Enable_DFF #(.WIDTH(1)) BranchLink_EX_MEM(.clk(clk), .reset(reset), .enable(enable),
.writeData(MEM_4_BranchLink), .q(WB_5_BranchLink));

//pc + 4 for branchLink
Uni_Enable_DFF #(.WIDTH(64)) pcPlus4_ForBL_EX_MEM(.clk(clk), .reset(reset), .enable(enable),
.writeData(MEM_4_pcPlus4), .q(WB_5_pcPlus4));

//ALU result
Uni_Enable_DFF #(.WIDTH(64)) ALUResult_EX_MEM(.clk(clk), .reset(reset), .enable(enable),
.writeData(MEM_4_ALUResult), .q(WB_5_ALUResult));

//ReadData Memory
Uni_Enable_DFF #(.WIDTH(64)) ReadDataMemory_EX_MEM(.clk(clk), .reset(reset), .enable(enable),
.writeData(MEM_4_ReadDataMemory), .q(WB_5_ReadDataMemory));

//Register Address for write data input to regfile
Uni_Enable_DFF #(.WIDTH(5)) RegisterAddress_EX_MEM(.clk(clk), .reset(reset), .enable(enable),
.writeData(MEM_4_reg_Address), .q(WB_5_reg_Address));

	
endmodule

	