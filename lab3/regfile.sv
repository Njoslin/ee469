`timescale 1ns/10ps
module regfile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, clk, ReadData1, ReadData2);

	//ports
	input logic	[4:0] 	ReadRegister1, ReadRegister2, WriteRegister;
	input logic [63:0]	WriteData;
	input logic 			RegWrite, clk;
	output logic [63:0]	ReadData1, ReadData2;
	
	//wire for writeEnable for each register
	logic [31:0] regEn;
	
	//output of each register
	logic [31:0][63:0] regDataOut;
	
	
	//decoder
	decoderLogic a(.enable(RegWrite), .a(WriteRegister), .r(regEn));
	
	//generating 32 registers
	genvar i; 
	generate
		for(i = 0; i < 31; i++)begin : eachDff							 
			register_genr regEnable(.D(WriteData), .en(regEn[i]), .Q(regDataOut[i]), .clk(clk), .reset(1'b0));
		end
	endgenerate
	
	assign regDataOut[31] = 64'b0;	

	
	
	//two 64x32x1 muxes inst,
	sixtyFour_one_mux one(.data_in(regDataOut), .data_out(ReadData1), .sel(ReadRegister1));
	sixtyFour_one_mux two(.data_in(regDataOut), .data_out(ReadData2), .sel(ReadRegister2));
	
endmodule
	