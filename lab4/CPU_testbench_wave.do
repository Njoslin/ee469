onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label REGISTERS -childformat {{{/CPU_testbench/dut/RegisterFile/regDataOut[31]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[30]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[29]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[28]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[27]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[26]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[25]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[24]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[23]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[22]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[21]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[20]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[19]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[18]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[17]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[16]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[15]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[14]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[13]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[12]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[11]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[10]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[9]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[8]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[7]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[6]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[5]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[4]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[3]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[2]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[1]} -radix decimal} {{/CPU_testbench/dut/RegisterFile/regDataOut[0]} -radix decimal}} -expand -subitemconfig {{/CPU_testbench/dut/RegisterFile/regDataOut[31]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[30]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[29]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[28]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[27]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[26]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[25]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[24]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[23]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[22]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[21]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[20]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[19]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[18]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[17]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[16]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[15]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[14]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[13]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[12]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[11]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[10]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[9]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[8]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[7]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[6]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[5]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[4]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[3]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[2]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[1]} {-height 15 -radix decimal} {/CPU_testbench/dut/RegisterFile/regDataOut[0]} {-height 15 -radix decimal}} /CPU_testbench/dut/RegisterFile/regDataOut
add wave -noupdate -radix binary /CPU_testbench/dut/instructionMemory/instruction
add wave -noupdate /CPU_testbench/clk
add wave -noupdate /CPU_testbench/reset
add wave -noupdate -group ProgramCounter -radix decimal -childformat {{{/CPU_testbench/dut/programCounter/inPC[63]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[62]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[61]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[60]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[59]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[58]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[57]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[56]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[55]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[54]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[53]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[52]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[51]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[50]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[49]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[48]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[47]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[46]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[45]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[44]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[43]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[42]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[41]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[40]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[39]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[38]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[37]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[36]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[35]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[34]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[33]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[32]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[31]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[30]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[29]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[28]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[27]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[26]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[25]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[24]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[23]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[22]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[21]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[20]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[19]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[18]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[17]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[16]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[15]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[14]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[13]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[12]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[11]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[10]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[9]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[8]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[7]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[6]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[5]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[4]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[3]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[2]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[1]} -radix decimal} {{/CPU_testbench/dut/programCounter/inPC[0]} -radix decimal}} -subitemconfig {{/CPU_testbench/dut/programCounter/inPC[63]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[62]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[61]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[60]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[59]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[58]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[57]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[56]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[55]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[54]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[53]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[52]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[51]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[50]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[49]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[48]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[47]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[46]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[45]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[44]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[43]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[42]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[41]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[40]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[39]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[38]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[37]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[36]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[35]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[34]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[33]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[32]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[31]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[30]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[29]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[28]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[27]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[26]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[25]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[24]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[23]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[22]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[21]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[20]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[19]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[18]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[17]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[16]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[15]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[14]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[13]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[12]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[11]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[10]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[9]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[8]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[7]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[6]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[5]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[4]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[3]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[2]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[1]} {-height 15 -radix decimal} {/CPU_testbench/dut/programCounter/inPC[0]} {-height 15 -radix decimal}} /CPU_testbench/dut/programCounter/inPC
add wave -noupdate -group ProgramCounter -radix decimal /CPU_testbench/dut/programCounter/outPC
add wave -noupdate -group PPR1 -expand -group Inputs -radix decimal /CPU_testbench/dut/PP1/IF_1_pc
add wave -noupdate -group PPR1 -expand -group Inputs -radix decimal /CPU_testbench/dut/PP1/IF_1_pcPlusFour
add wave -noupdate -group PPR1 -expand -group Inputs -radix binary /CPU_testbench/dut/PP1/IF_1_instruction
add wave -noupdate -group PPR1 -expand -group Outputs -radix decimal /CPU_testbench/dut/PP1/ID_2_pc
add wave -noupdate -group PPR1 -expand -group Outputs -radix decimal /CPU_testbench/dut/PP1/ID_2_pcPlusFour
add wave -noupdate -group PPR1 -expand -group Outputs -radix binary /CPU_testbench/dut/PP1/ID_2_instruction
add wave -noupdate -group RegisterFile -radix unsigned /CPU_testbench/dut/RegisterFile/ReadRegister1
add wave -noupdate -group RegisterFile -radix decimal /CPU_testbench/dut/RegisterFile/ReadRegister2
add wave -noupdate -group RegisterFile -radix unsigned /CPU_testbench/dut/RegisterFile/WriteRegister
add wave -noupdate -group RegisterFile -radix decimal /CPU_testbench/dut/RegisterFile/WriteData
add wave -noupdate -group RegisterFile -radix unsigned /CPU_testbench/dut/RegisterFile/RegWrite
add wave -noupdate -group RegisterFile -radix decimal /CPU_testbench/dut/RegisterFile/ReadData1
add wave -noupdate -group RegisterFile -radix decimal /CPU_testbench/dut/RegisterFile/ReadData2
add wave -noupdate -group PPR2 -group INPUTS -radix decimal /CPU_testbench/dut/PPR2/ID_2_pcPlusFour
add wave -noupdate -group PPR2 -group INPUTS -radix decimal /CPU_testbench/dut/PPR2/ID_2_ReadData1
add wave -noupdate -group PPR2 -group INPUTS -radix decimal /CPU_testbench/dut/PPR2/ID_2_ReadData2
add wave -noupdate -group PPR2 -group INPUTS -radix decimal /CPU_testbench/dut/PPR2/ID_2_Immediate
add wave -noupdate -group PPR2 -group INPUTS -radix decimal /CPU_testbench/dut/PPR2/IF_ID_Register_Rm
add wave -noupdate -group PPR2 -group INPUTS -radix unsigned /CPU_testbench/dut/PPR2/IF_ID_Register_Rn
add wave -noupdate -group PPR2 -group INPUTS -radix unsigned /CPU_testbench/dut/PPR2/ID_2_reg_Address
add wave -noupdate -group PPR2 -group INPUTS /CPU_testbench/dut/PPR2/ID_2_instruc_OPCODE
add wave -noupdate -group PPR2 -expand -group OUTPUTS -radix decimal /CPU_testbench/dut/PPR2/EX_3_pcPlusFour
add wave -noupdate -group PPR2 -expand -group OUTPUTS -radix decimal /CPU_testbench/dut/PPR2/EX_3_ReadData1
add wave -noupdate -group PPR2 -expand -group OUTPUTS -radix decimal /CPU_testbench/dut/PPR2/EX_3_ReadData2
add wave -noupdate -group PPR2 -expand -group OUTPUTS -radix decimal /CPU_testbench/dut/PPR2/EX_3_Immediate
add wave -noupdate -group PPR2 -expand -group OUTPUTS -radix decimal /CPU_testbench/dut/PPR2/INTO_IF_ID_Register_Rm
add wave -noupdate -group PPR2 -expand -group OUTPUTS -radix unsigned /CPU_testbench/dut/PPR2/INTO_IF_ID_Register_Rn
add wave -noupdate -group PPR2 -expand -group OUTPUTS -radix unsigned /CPU_testbench/dut/PPR2/EX_3_reg_Address
add wave -noupdate -group PPR2 -expand -group OUTPUTS -radix binary /CPU_testbench/dut/PPR2/EX_3_instruc_OPCODE
add wave -noupdate -group PPR2 -group Controls -group InputControls /CPU_testbench/dut/PPR2/ID_2_MemRead
add wave -noupdate -group PPR2 -group Controls -group InputControls /CPU_testbench/dut/PPR2/ID_2_MemtoReg
add wave -noupdate -group PPR2 -group Controls -group InputControls /CPU_testbench/dut/PPR2/ID_2_MemWrite
add wave -noupdate -group PPR2 -group Controls -group InputControls /CPU_testbench/dut/PPR2/ID_2_ALUSrc
add wave -noupdate -group PPR2 -group Controls -group InputControls /CPU_testbench/dut/PPR2/ID_2_RegWrite
add wave -noupdate -group PPR2 -group Controls -group InputControls /CPU_testbench/dut/PPR2/ID_2_BranchLink
add wave -noupdate -group PPR2 -group Controls -group InputControls /CPU_testbench/dut/PPR2/ID_2_ALUOp
add wave -noupdate -group PPR2 -group Controls -group OutputControls /CPU_testbench/dut/PPR2/EX_3_MemRead
add wave -noupdate -group PPR2 -group Controls -group OutputControls /CPU_testbench/dut/PPR2/EX_3_MemtoReg
add wave -noupdate -group PPR2 -group Controls -group OutputControls /CPU_testbench/dut/PPR2/EX_3_MemWrite
add wave -noupdate -group PPR2 -group Controls -group OutputControls /CPU_testbench/dut/PPR2/EX_3_ALUSrc
add wave -noupdate -group PPR2 -group Controls -group OutputControls /CPU_testbench/dut/PPR2/EX_3_RegWrite
add wave -noupdate -group PPR2 -group Controls -group OutputControls /CPU_testbench/dut/PPR2/EX_3_BranchLink
add wave -noupdate -group PPR2 -group Controls -group OutputControls /CPU_testbench/dut/PPR2/EX_3_ALUOp
add wave -noupdate -group FORWARD -expand -group Inputs /CPU_testbench/dut/FORWARD_UNIT/INTO_IF_ID_Register_Rm
add wave -noupdate -group FORWARD -expand -group Inputs /CPU_testbench/dut/FORWARD_UNIT/INTO_IF_ID_Register_Rn
add wave -noupdate -group FORWARD -expand -group Inputs /CPU_testbench/dut/FORWARD_UNIT/IF_ID_Register_Rd
add wave -noupdate -group FORWARD -expand -group Inputs /CPU_testbench/dut/FORWARD_UNIT/ID_EX_Register_Rd
add wave -noupdate -group FORWARD -expand -group Inputs /CPU_testbench/dut/FORWARD_UNIT/EX_MEM_Register_Rd
add wave -noupdate -group FORWARD -expand -group Inputs /CPU_testbench/dut/FORWARD_UNIT/MEM_WB_Instruction_Address
add wave -noupdate -group FORWARD -expand -group Inputs /CPU_testbench/dut/FORWARD_UNIT/ID_EX_RegWrite
add wave -noupdate -group FORWARD -expand -group Inputs /CPU_testbench/dut/FORWARD_UNIT/MEM_4_RegWrite
add wave -noupdate -group FORWARD -expand -group Inputs /CPU_testbench/dut/FORWARD_UNIT/WB_5_RegWrite
add wave -noupdate -group FORWARD -expand -group Inputs /CPU_testbench/dut/FORWARD_UNIT/EX_MEM_MemWrite
add wave -noupdate -group FORWARD -expand -group Inputs /CPU_testbench/dut/FORWARD_UNIT/WB_5_MemtoReg
add wave -noupdate -group FORWARD -expand -group Inputs /CPU_testbench/dut/FORWARD_UNIT/ID_EX_MemWrite
add wave -noupdate -group FORWARD -expand -group Inputs /CPU_testbench/dut/FORWARD_UNIT/EX_MEM_MemtoReg
add wave -noupdate -group FORWARD -expand -group Inputs /CPU_testbench/dut/FORWARD_UNIT/ID_EX_OPCODE_S
add wave -noupdate -group FORWARD -expand -group Inputs /CPU_testbench/dut/FORWARD_UNIT/IF_ID_OPCODE_B
add wave -noupdate -group FORWARD -expand -group Inputs /CPU_testbench/dut/FORWARD_UNIT/branchRegister
add wave -noupdate -group FORWARD -expand -group Inputs /CPU_testbench/dut/FORWARD_UNIT/cbzBranch
add wave -noupdate -group FORWARD -expand -group Output /CPU_testbench/dut/FORWARD_UNIT/Forward_A
add wave -noupdate -group FORWARD -expand -group Output /CPU_testbench/dut/FORWARD_UNIT/Forward_B
add wave -noupdate -group FORWARD -expand -group Output /CPU_testbench/dut/FORWARD_UNIT/overflowForward
add wave -noupdate -group FORWARD -expand -group Output /CPU_testbench/dut/FORWARD_UNIT/negativeForward
add wave -noupdate -group FORWARD -expand -group Output /CPU_testbench/dut/FORWARD_UNIT/STUR_1_RAW
add wave -noupdate -group FORWARD -expand -group Output /CPU_testbench/dut/FORWARD_UNIT/CBZ_Forward
add wave -noupdate -group FORWARD -expand -group Output /CPU_testbench/dut/FORWARD_UNIT/BR_Forward
add wave -noupdate -group FORWARD -expand -group Output /CPU_testbench/dut/FORWARD_UNIT/forwardSturForReadData
add wave -noupdate -group Foward_A_Mux -radix decimal /CPU_testbench/dut/FORWARD_A/in0
add wave -noupdate -group Foward_A_Mux -radix decimal /CPU_testbench/dut/FORWARD_A/in1
add wave -noupdate -group Foward_A_Mux -radix decimal /CPU_testbench/dut/FORWARD_A/in2
add wave -noupdate -group Foward_A_Mux /CPU_testbench/dut/FORWARD_A/sel
add wave -noupdate -group Foward_A_Mux -radix decimal /CPU_testbench/dut/FORWARD_A/finalOutput
add wave -noupdate -group Forward_B_Mux -radix decimal /CPU_testbench/dut/FORWARD_B/in0
add wave -noupdate -group Forward_B_Mux -radix decimal /CPU_testbench/dut/FORWARD_B/in1
add wave -noupdate -group Forward_B_Mux -radix decimal /CPU_testbench/dut/FORWARD_B/in2
add wave -noupdate -group Forward_B_Mux /CPU_testbench/dut/FORWARD_B/sel
add wave -noupdate -group Forward_B_Mux -radix decimal /CPU_testbench/dut/FORWARD_B/finalOutput
add wave -noupdate -group ALU -radix decimal /CPU_testbench/dut/ALU/A
add wave -noupdate -group ALU -radix decimal /CPU_testbench/dut/ALU/B
add wave -noupdate -group ALU -radix decimal /CPU_testbench/dut/ALU/result
add wave -noupdate -group ALU -radix decimal /CPU_testbench/dut/ALU/adderResult
add wave -noupdate -group FlagRegister /CPU_testbench/dut/FLAGREGISTER/negative
add wave -noupdate -group FlagRegister /CPU_testbench/dut/FLAGREGISTER/overflow
add wave -noupdate -group FlagRegister /CPU_testbench/dut/FLAGREGISTER/zero
add wave -noupdate -group FlagRegister /CPU_testbench/dut/FLAGREGISTER/carry_out
add wave -noupdate -group FlagRegister /CPU_testbench/dut/FLAGREGISTER/clk
add wave -noupdate -group FlagRegister /CPU_testbench/dut/FLAGREGISTER/reset
add wave -noupdate -group FlagRegister /CPU_testbench/dut/FLAGREGISTER/opcode
add wave -noupdate -group FlagRegister /CPU_testbench/dut/FLAGREGISTER/is_neg
add wave -noupdate -group FlagRegister /CPU_testbench/dut/FLAGREGISTER/is_over
add wave -noupdate -group FlagRegister /CPU_testbench/dut/FLAGREGISTER/is_zero
add wave -noupdate -group FlagRegister /CPU_testbench/dut/FLAGREGISTER/carry_o
add wave -noupdate -group FlagRegister /CPU_testbench/dut/FLAGREGISTER/flag_input
add wave -noupdate -group FlagRegister /CPU_testbench/dut/FLAGREGISTER/flag_output
add wave -noupdate -group FlagRegister /CPU_testbench/dut/FLAGREGISTER/enable
add wave -noupdate -group STURMUX2 -radix decimal /CPU_testbench/dut/STUR2_HAZARD_MUX/in0
add wave -noupdate -group STURMUX2 -radix decimal /CPU_testbench/dut/STUR2_HAZARD_MUX/in1
add wave -noupdate -group STURMUX2 -radix decimal /CPU_testbench/dut/STUR2_HAZARD_MUX/sel
add wave -noupdate -group STURMUX2 -radix decimal /CPU_testbench/dut/STUR2_HAZARD_MUX/finalOutput
add wave -noupdate -group PPR3 -group Inputs /CPU_testbench/dut/PPR3/EX_3_MemRead
add wave -noupdate -group PPR3 -group Inputs /CPU_testbench/dut/PPR3/EX_3_MemtoReg
add wave -noupdate -group PPR3 -group Inputs /CPU_testbench/dut/PPR3/EX_3_MemWrite
add wave -noupdate -group PPR3 -group Inputs /CPU_testbench/dut/PPR3/EX_3_RegWrite
add wave -noupdate -group PPR3 -group Inputs /CPU_testbench/dut/PPR3/EX_3_BranchLink
add wave -noupdate -group PPR3 -group Inputs /CPU_testbench/dut/PPR3/EX_3_pcPlusFour
add wave -noupdate -group PPR3 -group Inputs /CPU_testbench/dut/PPR3/EX_3_ALUResult
add wave -noupdate -group PPR3 -group Inputs /CPU_testbench/dut/PPR3/EX_3_ReadData2
add wave -noupdate -group PPR3 -group Inputs /CPU_testbench/dut/PPR3/EX_3_reg_Address
add wave -noupdate -group PPR3 -expand -group Outputs /CPU_testbench/dut/PPR3/MEM_4_MemRead
add wave -noupdate -group PPR3 -expand -group Outputs /CPU_testbench/dut/PPR3/MEM_4_MemtoReg
add wave -noupdate -group PPR3 -expand -group Outputs /CPU_testbench/dut/PPR3/MEM_4_MemWrite
add wave -noupdate -group PPR3 -expand -group Outputs /CPU_testbench/dut/PPR3/MEM_4_RegWrite
add wave -noupdate -group PPR3 -expand -group Outputs /CPU_testbench/dut/PPR3/MEM_4_BranchLink
add wave -noupdate -group PPR3 -expand -group Outputs /CPU_testbench/dut/PPR3/MEM_4_pcPlusFour
add wave -noupdate -group PPR3 -expand -group Outputs /CPU_testbench/dut/PPR3/MEM_4_ALUResult
add wave -noupdate -group PPR3 -expand -group Outputs /CPU_testbench/dut/PPR3/MEM_4_ReadData2
add wave -noupdate -group PPR3 -expand -group Outputs /CPU_testbench/dut/PPR3/MEM_4_reg_Address
add wave -noupdate -group {RAW MUX} -radix decimal /CPU_testbench/dut/STUR_1_HAZARD_MUX/in0
add wave -noupdate -group {RAW MUX} -radix decimal /CPU_testbench/dut/STUR_1_HAZARD_MUX/in1
add wave -noupdate -group {RAW MUX} -radix decimal /CPU_testbench/dut/STUR_1_HAZARD_MUX/finalOutput
add wave -noupdate -group {RAW MUX} /CPU_testbench/dut/STUR_1_HAZARD_MUX/sel
add wave -noupdate -group {Data Memory} -radix decimal /CPU_testbench/dut/MEMORY/address
add wave -noupdate -group {Data Memory} -radix decimal /CPU_testbench/dut/MEMORY/write_enable
add wave -noupdate -group {Data Memory} -radix decimal /CPU_testbench/dut/MEMORY/read_enable
add wave -noupdate -group {Data Memory} -radix decimal /CPU_testbench/dut/MEMORY/write_data
add wave -noupdate -group {Data Memory} -radix decimal /CPU_testbench/dut/MEMORY/read_data
add wave -noupdate -group {Data Memory} /CPU_testbench/dut/MEMORY/mem
add wave -noupdate -group PPR4 -group Inputs -radix unsigned /CPU_testbench/dut/PPR4/MEM_4_ReadDataMemory
add wave -noupdate -group PPR4 -group Inputs -radix unsigned /CPU_testbench/dut/PPR4/MEM_4_MemtoReg
add wave -noupdate -group PPR4 -group Inputs -radix unsigned /CPU_testbench/dut/PPR4/MEM_4_RegWrite
add wave -noupdate -group PPR4 -group Inputs -radix unsigned /CPU_testbench/dut/PPR4/MEM_4_BranchLink
add wave -noupdate -group PPR4 -group Inputs -radix unsigned /CPU_testbench/dut/PPR4/MEM_4_pcPlus4
add wave -noupdate -group PPR4 -group Inputs -radix unsigned /CPU_testbench/dut/PPR4/MEM_4_ALUResult
add wave -noupdate -group PPR4 -group Inputs -radix unsigned /CPU_testbench/dut/PPR4/MEM_4_reg_Address
add wave -noupdate -group PPR4 -expand -group Outputs -radix unsigned /CPU_testbench/dut/PPR4/WB_5_ReadDataMemory
add wave -noupdate -group PPR4 -expand -group Outputs -radix unsigned /CPU_testbench/dut/PPR4/WB_5_pcPlus4
add wave -noupdate -group PPR4 -expand -group Outputs -radix unsigned /CPU_testbench/dut/PPR4/WB_5_ALUResult
add wave -noupdate -group PPR4 -expand -group Outputs -radix unsigned /CPU_testbench/dut/PPR4/WB_5_reg_Address
add wave -noupdate -group PPR4 -expand -group Outputs -radix unsigned /CPU_testbench/dut/PPR4/WB_5_MemtoReg
add wave -noupdate -group PPR4 -expand -group Outputs -radix unsigned /CPU_testbench/dut/PPR4/WB_5_RegWrite
add wave -noupdate -group PPR4 -expand -group Outputs -radix unsigned /CPU_testbench/dut/PPR4/WB_5_BranchLink
add wave -noupdate -group {ALU or ReadData} -radix unsigned /CPU_testbench/dut/MUXTHREE/in0
add wave -noupdate -group {ALU or ReadData} -radix unsigned /CPU_testbench/dut/MUXTHREE/in1
add wave -noupdate -group {ALU or ReadData} /CPU_testbench/dut/MUXTHREE/sel
add wave -noupdate -group {ALU or ReadData} -radix unsigned /CPU_testbench/dut/MUXTHREE/finalOutput
add wave -noupdate -group BranchLinkMux -radix unsigned /CPU_testbench/dut/branchLinkRegisterMux/in0
add wave -noupdate -group BranchLinkMux -radix unsigned /CPU_testbench/dut/branchLinkRegisterMux/in1
add wave -noupdate -group BranchLinkMux /CPU_testbench/dut/branchLinkRegisterMux/sel
add wave -noupdate -group BranchLinkMux -radix unsigned /CPU_testbench/dut/branchLinkRegisterMux/finalOutput
add wave -noupdate -group BranchRegisterMux -radix decimal /CPU_testbench/dut/BR_Forward_MUX/in0
add wave -noupdate -group BranchRegisterMux -radix decimal /CPU_testbench/dut/BR_Forward_MUX/in1
add wave -noupdate -group BranchRegisterMux -radix decimal /CPU_testbench/dut/BR_Forward_MUX/in2
add wave -noupdate -group BranchRegisterMux /CPU_testbench/dut/BR_Forward_MUX/sel
add wave -noupdate -group BranchRegisterMux -radix decimal /CPU_testbench/dut/BR_Forward_MUX/finalOutput
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {467872233 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 212
configure wave -valuecolwidth 204
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {78966863 ps} {535317534 ps}
