//GOOD!

module PipelineRegister2_InstructionDecode_Execution (clk, reset, enable,  ID_2_ReadData1, ID_2_ReadData2, ID_2_Immediate,

ID_2_instruc_OPCODE, ID_2_reg_Address,  EX_3_ReadData1, EX_3_ReadData2, EX_3_Immediate, EX_3_instruc_OPCODE, EX_3_reg_Address,

ID_2_MemRead, ID_2_MemtoReg, ID_2_MemWrite, ID_2_ALUSrc, ID_2_RegWrite, ID_2_BranchLink,

EX_3_MemRead, EX_3_MemtoReg, EX_3_MemWrite, EX_3_ALUSrc, EX_3_RegWrite, EX_3_BranchLink,

ID_2_ALUOp, EX_3_ALUOp, EX_3_pcPlusFour, ID_2_pcPlusFour, IF_ID_Register_Rm, IF_ID_Register_Rn, INTO_IF_ID_Register_Rm, INTO_IF_ID_Register_Rn);


//All pieces for forwarding are here: IF_ID_Register_Rm, IF_ID_Register_Rn
//Into the forward unit --> IF_ID_Register_Rm, IF_ID_Register_Rn

/*remove 
-ID_2_PC and EX_3_PC
-CBZ
-B.LT
-BR
-UCB
*/

input logic [63:0]  ID_2_pcPlusFour, ID_2_ReadData1, ID_2_ReadData2, ID_2_Immediate;

output logic [63:0] EX_3_pcPlusFour, EX_3_ReadData1, EX_3_ReadData2, EX_3_Immediate;



//All pieces for forwarding are here: IF_ID_Register_Rm, IF_ID_Register_Rn
//Into the forward unit --> IF_ID_Register_Rm, IF_ID_Register_Rn
input logic [4:0] IF_ID_Register_Rm, IF_ID_Register_Rn; // these come directly form the Register inputs

output logic [4:0] INTO_IF_ID_Register_Rm, INTO_IF_ID_Register_Rn;

input logic [4:0] ID_2_reg_Address;

output logic [4:0] EX_3_reg_Address;

//for alu control
input logic [10:0] ID_2_instruc_OPCODE;

output logic [10:0] EX_3_instruc_OPCODE;





//default DFF inputs.
input logic clk, reset, enable; 

//control inputs to  ID HALF
input logic   ID_2_MemRead, ID_2_MemtoReg, ID_2_MemWrite, ID_2_ALUSrc, ID_2_RegWrite, 
 ID_2_BranchLink;

//control outputs to EX HALF
//reg2lOC will not be needed here, remove later
//branchReg gets removed too
output logic   EX_3_MemRead, EX_3_MemtoReg, EX_3_MemWrite, EX_3_ALUSrc, EX_3_RegWrite, 
 EX_3_BranchLink; 

//control inputs to ID HALF
input logic [1:0] ID_2_ALUOp;

//control inputs to EX HALF
output logic [1:0] EX_3_ALUOp;






//pc + 4 for branchLink reg
Uni_Enable_DFF #(.WIDTH(64)) ProgramCounter_BranchLink_ID_EX(.clk(clk), .reset(reset), .enable(enable),
.writeData(ID_2_pcPlusFour), .q(EX_3_pcPlusFour));

//readdata1reg
Uni_Enable_DFF #(.WIDTH(64)) ReadData1_ID_EX(.clk(clk), .reset(reset), .enable(enable),
.writeData(ID_2_ReadData1), .q(EX_3_ReadData1));

//readdata2reg
Uni_Enable_DFF #(.WIDTH(64)) ReadData2_ID_EX(.clk(clk), .reset(reset), .enable(enable),
.writeData(ID_2_ReadData2), .q(EX_3_ReadData2));

//Immediate reg
Uni_Enable_DFF #(.WIDTH(64)) Immediate_ID_EX(.clk(clk), .reset(reset), .enable(enable),
.writeData(ID_2_Immediate), .q(EX_3_Immediate));



//FORWARDING, GOOD!
//Rm
Uni_Enable_DFF #(.WIDTH(5)) IF_ID_Rm(.clk(clk), .reset(reset), .enable(enable),
.writeData(IF_ID_Register_Rm), .q(INTO_IF_ID_Register_Rm));

//Rn
Uni_Enable_DFF #(.WIDTH(5)) IF_ID_Rn(.clk(clk), .reset(reset), .enable(enable),
.writeData(IF_ID_Register_Rn), .q(INTO_IF_ID_Register_Rn));

//instruction opcode
Uni_Enable_DFF #(.WIDTH(11)) InstructionOPCODE_ID_EX(.clk(clk), .reset(reset), .enable(enable),
.writeData(ID_2_instruc_OPCODE), .q(EX_3_instruc_OPCODE));

//register address
Uni_Enable_DFF #(.WIDTH(5)) registerAddress_ID_EX(.clk(clk), .reset(reset), .enable(enable),
.writeData(ID_2_reg_Address), .q(EX_3_reg_Address));



//control inputs
//MemRead
Uni_Enable_DFF #(.WIDTH(1)) MemRead_ID_EX(.clk(clk), .reset(reset), .enable(enable),
.writeData(ID_2_MemRead), .q(EX_3_MemRead));

//MemtoReg
Uni_Enable_DFF #(.WIDTH(1)) MemtoReg_ID_EX(.clk(clk), .reset(reset), .enable(enable),
.writeData(ID_2_MemtoReg), .q(EX_3_MemtoReg));

//MemWrite
Uni_Enable_DFF #(.WIDTH(1)) MemWrite_ID_EX(.clk(clk), .reset(reset), .enable(enable),
.writeData(ID_2_MemWrite), .q(EX_3_MemWrite));

//ALUSrc --> 1'b
Uni_Enable_DFF #(.WIDTH(1)) ALUSrc_ID_EX(.clk(clk), .reset(reset), .enable(enable),
.writeData(ID_2_ALUSrc), .q(EX_3_ALUSrc));

//ALUOp --> 2'b
Uni_Enable_DFF #(.WIDTH(2)) ALUop_ID_EX(.clk(clk), .reset(reset), .enable(enable),
.writeData(ID_2_ALUOp), .q(EX_3_ALUOp));

//RegWrite
Uni_Enable_DFF #(.WIDTH(1)) RegWrite_ID_EX(.clk(clk), .reset(reset), .enable(enable),
.writeData(ID_2_RegWrite), .q(EX_3_RegWrite));

//BranchLink
Uni_Enable_DFF #(.WIDTH(1)) BranchLink_ID_EX(.clk(clk), .reset(reset), .enable(enable),
.writeData(ID_2_BranchLink), .q(EX_3_BranchLink));

endmodule




