`timescale 1ns/10ps
module CPU(reset, clk);
	input logic reset, clk;
	//input to the pc counter
	logic [63:0] pcInput;
	//wire that carries the output of pc into the read address of instruction mem
	logic [63:0] PCOUT;
	//wire for first input of 
	logic [63:0] sequentialInstructionUpdate;
	//shiftINSTRUCTIONUPDATE
	logic [63:0] shiftedInstructionUpdate;
	//carryout for adder
	logic carryOut1, carryOut2;
	
	//wire for the output of the isntruction memory, this is the actually instructions, opcode etc
	logic [31:0] INSTRUCTION;
	
	//logic for the control outputs
	logic Reg2Loc, CBZBranch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, UnconditionalBranch, BranchLessThan, BranchLink, BranchRegister;
	//2 bit output for the ALUOp from the control 
	logic [1:0] ALUOp;
	
	//output or the input from the readRegister2Mux into the regfile
	logic [4:0] REG2LOCATION;
	
	//HOLDER FOR OUTPUT OF MUX FROM MEM TO REG
	logic [63:0] WriteDataInput, normalWriteDataInput;
	
	//wires for the output of the register files
	logic [63:0] ReadData1, ReadData2;
	
	//wire for the sign extension
	logic [63:0] sign_extended;
	
	//second input for the ALU
	logic [63:0] secondALUInput;
	
	//alu control from the ALU Control Unit
	logic [2:0] ALUOPERATION;
	
	//result of alu operation
	logic [63:0] ALURESULT;
	
	//alu flag outputs
	logic negative, zero, overflow, carry_out;
	
	//flag register output flags
	logic is_neg, is_zero, is_overflow, carry_o;
	
	//output of data memory
	logic [63:0] ReadDataMemory;
	
	//shifted value into mux4
	logic [63:0] shiftedOffset;
	
	//logic for branch + 4 or not
	logic branchEitherPlus4OrOffset, cbzTaken, bltTaken;
	
	//logic for selected register for BranchLink
	logic [4:0] selectedRegister;
	
	logic [1:0] pcsel;
	
	//pc
	PC programCounter(.inPC(pcInput), .outPC(PCOUT), .clk(clk), .reset(reset));
	
	//now send the output of pc into the 4 + adder and instruction memory
	basic64BitAdder plus4Adder(.a(PCOUT), .b(64'b0000000000000000000000000000000000000000000000000000000000000100),
	.result(sequentialInstructionUpdate), .cin(1'b0), .cout(carryOut1));
	
	//now send the output of pc into the instruction memory
	instructmem instructionMemory(.address(PCOUT), .instruction(INSTRUCTION), .clk(clk));
	
	//sending INSTRUCTION to control, regfile, and sign extension
	//first the controlUnit
	CONTROL control(.OPCODE(INSTRUCTION[31:21]), .Reg2Loc(Reg2Loc), .CBZBranch(CBZBranch), 
	.MemRead(MemRead), .MemtoReg(MemtoReg), .MemWrite(MemWrite), .ALUSrc(ALUSrc), .RegWrite(RegWrite),
	.ALUOp(ALUOp), .UnconditionalBranch(UnconditionalBranch), .BranchLessThan(BranchLessThan), .BranchLink(BranchLink), .BranchRegister(BranchRegister));
	
	//mux to select whihc instrusction field is sent into regfile
	readRegister2Mux READREG2MUX(.loadTypeField(INSTRUCTION[20:16]), .otherTypeField(INSTRUCTION[4:0]), .reg2Selection(REG2LOCATION), .sel(Reg2Loc));
	
	//mux for selecting the register to write to. if one, select x30
	two_to_one_writeRegisterMux branchLinkRegisterSelection(.in0(INSTRUCTION[4:0]), .in1(5'b11110), 
	.sel(BranchLink), .finalOutput(selectedRegister));
	
	//select normal write data or pc + 4
	two_to_one_64mux MUXFIVE(.in0(normalWriteDataInput), .in1(sequentialInstructionUpdate), .sel(BranchLink), .finalOutput(WriteDataInput));
	
	
	//next the regfile, however Read Register 2 must come from a mux.
	regfile RegisterFile(.ReadRegister1(INSTRUCTION[9:5]), .ReadRegister2(REG2LOCATION), .WriteRegister(selectedRegister), .WriteData(WriteDataInput),
	.RegWrite(RegWrite), .ReadData1(ReadData1), .ReadData2(ReadData2), .clk(clk));
	
	//now instantiating the sign extention
	signextension SignExtension(.instructions(INSTRUCTION), .out(sign_extended));
	
	//mux to select output of sign extention or output from regfile
	two_to_one_64mux MUXTWO(.in0(ReadData2), .in1(sign_extended), .sel(ALUSrc), .finalOutput(secondALUInput));
	
	//ALUCONTROL UNIT
	ALUCONTROL aluCONTROL(.opcode(INSTRUCTION[31:21]), .ALUOp(ALUOp), .aluoperation(ALUOPERATION));
	
	//now instantiating the ALU
	alu ALU(.A(ReadData1), .B(secondALUInput), .cntrl(ALUOPERATION), .result(ALURESULT), .negative(negative), .carry_out(carry_out), 
	.overflow(overflow), .zero(zero));
	
	//flag regsiter to grab the flags from the ALU, this will be used for branching cases
	flag_register FLAGREGISTER(.clk(clk), .reset(reset), .negative(negative), .carry_out(carry_out), 
	.overflow(overflow), .zero(zero), .is_neg(is_neg), .is_over(is_overflow), .is_zero(is_zero), .carry_o(carry_o), .opcode(INSTRUCTION[31:21]));
	
	//memory time
	datamem MEMORY(.address(ALURESULT), .write_data(ReadData2), .write_enable(MemWrite), .read_enable(MemRead), .read_data(ReadDataMemory), .xfer_size(4'b1000),
	.clk(clk));
	
	//mux to select ALU or read the data from memory. this will go into the write data input to the regfile
	two_to_one_64mux MUXTHREE(.in0(ALURESULT), .in1(ReadDataMemory), .sel(MemtoReg), .finalOutput(normalWriteDataInput));
	
	//shift the output of sign extention by 4
	shifter shiftby4(.value(sign_extended), .direction(1'b0), .distance(6'b000010), .result(shiftedOffset));
	
	//branching instruction changes
	//now send the output of pc into the --> PC + SignExtend and instruction memory
	basic64BitAdder pcPLUSsignextend(.a(PCOUT), .b(shiftedOffset), .result(shiftedInstructionUpdate), .cin(1'b0), .cout(carryOut2));
	
	
	assign bltTaken = (is_overflow != is_neg) && BranchLessThan;
	
	assign cbzTaken = zero && CBZBranch; //for CBZ we want to check the current flags thrown by the ALU after operation
	

	//set the next pcsel for either sequential or shifted instruction update
	always_comb begin
		pcsel = 2'b00;
		//if unconditional or conditional, pc = pc + address (sign extend)
		if(cbzTaken || bltTaken || BranchLink || UnconditionalBranch)begin
			pcsel = 2'b01;
		end
		
		if(BranchRegister)begin
			pcsel = 2'b10;
		end
	end
	
	//determine either pc + 4 or pc + address
	three_to_one_64mux MUXFOUR(.in0(sequentialInstructionUpdate), .in1(shiftedInstructionUpdate), .in2(ReadData2), .sel(pcsel), .out(pcInput));
	
endmodule
	
	
	
	
	
	
	
	
	