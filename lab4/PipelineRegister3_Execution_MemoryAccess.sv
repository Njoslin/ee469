module PipelineRegister3_Execution_MemoryAccess(clk, reset, enable,

 EX_3_MemRead, EX_3_MemtoReg, EX_3_MemWrite, EX_3_RegWrite, EX_3_BranchLink, 
 
 MEM_4_MemRead, MEM_4_MemtoReg, MEM_4_MemWrite, MEM_4_RegWrite, 

 MEM_4_BranchLink, EX_3_ALUResult, MEM_4_ALUResult, EX_3_reg_Address, 
 
 MEM_4_reg_Address, EX_3_pcPlusFour, MEM_4_pcPlusFour, EX_3_ReadData2, MEM_4_ReadData2);


	//default DFF inputs.
	input logic clk, reset, enable; 

	//control inputs to EX HALF
	input logic EX_3_MemRead, EX_3_MemtoReg, EX_3_MemWrite, EX_3_RegWrite, EX_3_BranchLink;
	
	//control outputs to the MEM Half
	output logic MEM_4_MemRead, MEM_4_MemtoReg, MEM_4_MemWrite, MEM_4_RegWrite,  MEM_4_BranchLink;
	
	//the branchLink will be for X30 = PC + 4
	input logic [63:0] EX_3_pcPlusFour;
	output logic [63:0] MEM_4_pcPlusFour;


	//ALU result
	input logic [63:0] EX_3_ALUResult;

	output logic [63:0] MEM_4_ALUResult;
	
	//for STUR
	input logic [63:0] EX_3_ReadData2;
	output logic [63:0] MEM_4_ReadData2; 


	//register address via instruction field Rd/Rt --> [4:0]
	input logic [4:0] EX_3_reg_Address;

	output logic [4:0] MEM_4_reg_Address;

//control inputs
//MemRead
Uni_Enable_DFF #(.WIDTH(1)) MemRead_EX_MEM(.clk(clk), .reset(reset), .enable(enable),
.writeData(EX_3_MemRead), .q(MEM_4_MemRead));

//MemtoReg
Uni_Enable_DFF #(.WIDTH(1)) MemtoReg_EX_MEM(.clk(clk), .reset(reset), .enable(enable),
.writeData(EX_3_MemtoReg), .q(MEM_4_MemtoReg));

//MemWrite
Uni_Enable_DFF #(.WIDTH(1)) MemWrite_EX_MEM(.clk(clk), .reset(reset), .enable(enable),
.writeData(EX_3_MemWrite), .q(MEM_4_MemWrite));

//RegWrite
Uni_Enable_DFF #(.WIDTH(1)) RegWrite_EX_MEM(.clk(clk), .reset(reset), .enable(enable),
.writeData(EX_3_RegWrite), .q(MEM_4_RegWrite));

//BranchLink
Uni_Enable_DFF #(.WIDTH(1)) BranchLink_EX_MEM(.clk(clk), .reset(reset), .enable(enable),
.writeData(EX_3_BranchLink), .q(MEM_4_BranchLink));




//ALU result
Uni_Enable_DFF #(.WIDTH(64)) alu_Result_EX_MEM(.clk(clk), .reset(reset), .enable(enable),
.writeData(EX_3_ALUResult), .q(MEM_4_ALUResult));

//BranchLinking pc + 4. will be carried to stage 5
Uni_Enable_DFF #(.WIDTH(64)) BranchLinkPcPlusFour_EX_MEM(.clk(clk), .reset(reset), .enable(enable),
.writeData(EX_3_pcPlusFour), .q(MEM_4_pcPlusFour));

//ReadData for the STUR
Uni_Enable_DFF #(.WIDTH(64)) ReadData2_EX_MEM(.clk(clk), .reset(reset), .enable(enable),
.writeData(EX_3_ReadData2), .q(MEM_4_ReadData2));


//register address via instruction field Rd/Rt --> [4:0]
Uni_Enable_DFF #(.WIDTH(5)) registerAddress_EX_MEM(.clk(clk), .reset(reset), .enable(enable),
.writeData(EX_3_reg_Address), .q(MEM_4_reg_Address));
	

endmodule
