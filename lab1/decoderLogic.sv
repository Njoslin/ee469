`timescale 1ns/10ps
module decoderLogic(enable, r, a);
	//if zero, then output is false regardless of input
	input logic enable;
	input logic [4:0] a; //unique address for each register
	output logic [31:0] r; //enable single for n register going out
	
	logic [31:0] hold;
	
	//***ZERO INDEXING FOR REGISTERS 
	
	//1st REGISTER
	and #50 a0(hold[0], ~a[4], ~a[3], ~a[2], ~a[1]);
	and #50 reg0(r[0], hold[0], ~a[0], enable);
	
	
	//2nd REGISTER
	and #50 a1(hold[1], ~a[4], ~a[3], ~a[2], ~a[1]);
	and #50 reg1(r[1], hold[1], a[0], enable);
	
	
	//3rd REGISTER
	and #50 a2(hold[2], ~a[4], ~a[3], ~a[2], a[1]);
	and #50 reg2(r[2], hold[2], ~a[0], enable);
	
	//4th REGISTER
	and #50 a3(hold[3], ~a[4], ~a[3], ~a[2], a[1]);
	and #50 reg3(r[3], hold[3], a[0], enable);
	
	//5th REGISTER
	and #50 a4(hold[4], ~a[4], ~a[3], a[2], ~a[1]);
	and #50 reg4(r[4], hold[4], ~a[0], enable);
	
	//6th REGISTER
	and #50 a5(hold[5], ~a[4], ~a[3], a[2], ~a[1]);
	and #50 reg5(r[5], hold[5], a[0], enable);
	
	
	//7th REGISTER
	and #50 a6(hold[6], ~a[4], ~a[3], a[2], a[1]);
	and #50 reg6(r[6], hold[6], ~a[0], enable);
	
	
	//8th REGISTER
	and #50 a7(hold[7], ~a[4], ~a[3], a[2], a[1]);
	and #50 reg7(r[7], hold[7], a[0], enable);
	
	
	//9th REGISTER
	and #50 a8(hold[8], ~a[4], a[3], ~a[2], ~a[1]);
	and #50 reg8(r[8], hold[8], ~a[0], enable);
	
	//10th REGISTER
	and #50 a9(hold[9], ~a[4], a[3], ~a[2], ~a[1]);
	and #50 reg9(r[9], hold[9], a[0], enable);
	
	
	//11th REGISTER
	and #50 a10(hold[10], ~a[4], a[3], ~a[2], a[1]);
	and #50 reg10(r[10], hold[10], ~a[0], enable);
	
	
	//12th REGISTER
	and #50 a11(hold[11], ~a[4], a[3], ~a[2], a[1]);
	and #50 reg11(r[11], hold[11], a[0], enable);
	
	
	//13th REGISTER
	and #50 a12(hold[12], ~a[4], a[3], a[2], ~a[1]);
	and #50 reg12(r[12], hold[12], ~a[0], enable);
	
	
	//14th REGISTER
	and #50 a13(hold[13], ~a[4], a[3], a[2], ~a[1]);
	and #50 reg13(r[13], hold[13], a[0], enable);
	
	
	//15th REGISTER
	and #50 a14(hold[14], ~a[4], a[3], a[2], a[1]);
	and #50 reg14(r[14], hold[14], ~a[0], enable);
	
	
	//16th REGISTER
	and #50 a15(hold[15], ~a[4], a[3], a[2], a[1]);
	and #50 reg15(r[15], hold[15], a[0], enable);
	
	
	//17th REGISTER
	and #50 a16(hold[16], a[4], ~a[3], ~a[2], ~a[1]);
	and #50 reg16(r[16], hold[16], ~a[0], enable);
	
	
	//18th REGISTER
	and #50 a17(hold[17], a[4], ~a[3], ~a[2], ~a[1]);
	and #50 reg17(r[17], hold[17], a[0], enable);
	
	
	//19th REGISTER
	and #50 a18(hold[18], a[4], ~a[3], ~a[2], a[1]);
	and #50 reg18(r[18], hold[18], ~a[0], enable);
	
	
	//20th REGISTER
	and #50 a19(hold[19], a[4], ~a[3], ~a[2], a[1]);
	and #50 reg19(r[19], hold[19], a[0], enable);
	
	
	//21st REGISTER
	and #50 a20(hold[20], a[4], ~a[3], a[2], ~a[1]);
	and #50 reg20(r[20], hold[20], ~a[0], enable);
	
	
	//22nd REGISTER
	and #50 a21(hold[21], a[4], ~a[3], a[2], ~a[1]);
	and #50 reg21(r[21], hold[21], a[0], enable);
	
	
	//23rd REGISTER
	and #50 a22(hold[22], a[4], ~a[3], a[2], a[1]);
	and #50 reg22(r[22], hold[22], ~a[0], enable);
	
	
	//24th REGISTER
	and #50 a23(hold[23], a[4], ~a[3], a[2], a[1]);
	and #50 reg23(r[23], hold[23], a[0], enable);
	
	
	//25th REGISTER
	and #50 a24(hold[24], a[4], a[3], ~a[2], ~a[1]);
	and #50 reg24(r[24], hold[24], ~a[0], enable);
	
	
	//26th REGISTER
	and #50 a25(hold[25], a[4], a[3], ~a[2], ~a[1]);
	and #50 reg25(r[25], hold[25], a[0], enable);
	
	
	//27th REGISTER
	and #50 a26(hold[26], a[4], a[3], ~a[2], a[1]);
	and #50 reg26(r[26], hold[26], ~a[0], enable);
	
	
	//28th REGISTER
	and #50 a27(hold[27], a[4], a[3], ~a[2], a[1]);
	and #50 reg27(r[27], hold[27], a[0], enable);
	
	
	//29th REGISTER
	and #50 a28(hold[28], a[4], a[3], a[2], ~a[1]);
	and #50 reg28(r[28], hold[28], ~a[0], enable);
	
	
	//30th REGISTER
	and #50 a29(hold[29], a[4], a[3], a[2], ~a[1]);
	and #50 reg29(r[29], hold[29], a[0], enable);
	
	
	
	//31st REGISTER
	and #50 a30(hold[30], a[4], a[3], a[2], a[1]);
	and #50 reg30(r[30], hold[30], ~a[0], enable);
	
	
	//32nd REGISTER will set to zero
	and #50 a31(hold[31], a[4], a[3], a[2], a[1]);
	and #50 reg31(r[31], hold[31], a[0], enable);
	
	
endmodule
	