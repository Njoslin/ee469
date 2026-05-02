`timescale 1ns/10ps
module alu(A, B, cntrl, result, negative, zero, overflow, carry_out);

	input logic [63:0]	A, B;
	input logic	[2:0]		cntrl;
	output logic[63:0]	result;
	output logic negative, zero, overflow, carry_out;// will send this to a flag reg
	
	logic [7:0][63:0] in; //selects the correct output to the mux
	logic [63:0]adderResult;
	
	
	//passB passBInput(.a(cntrl), .readData(B), .bus_64(B)); //000
	//either subtraction or addition
	sixtyFour_adder ader(.a(A), .b(B), .ac(cntrl) ,.result(adderResult), .cin(1'b0), .cout(carry_out), .overflow(overflow));
	bitwiseAnd anding(.readData1(A) , .readData2(B), .a(cntrl), .result(in[4])); //100
	bitwiseOr oring(.readData1(A) , .readData2(B), .a(cntrl), .result(in[5])); //101
	bitwiseXOR xoring(.readData1(A) , .readData2(B), .a(cntrl), .result(in[6])); //110
	
	assign in[0] = B; //passing B is a bit useless, if we get this input, just output B
	assign in[2] = adderResult; //010 addition
	assign in[3] = adderResult; //011 subtraction
	assign in[1] = 64'b0; //DONT CARE
	assign in[7] = 64'b0; //DONT CARE
	
	//outputs the values
	genvar i;
	
	generate
	for(i = 0; i < 64; i++) begin: sftem
	
		//input for 8:1 mux, based on selection, we will assign each bit of the 64 bus into m
		logic [7:0] mux_inputs;
		assign mux_inputs[0] = in[0][i];
		assign mux_inputs[1] = in[1][i];
		assign mux_inputs[2] = in[2][i];
		assign mux_inputs[3] = in[3][i];
		assign mux_inputs[4] = in[4][i];
		assign mux_inputs[5] = in[5][i];
		assign mux_inputs[6] = in[6][i];
		assign mux_inputs[7] = in[7][i];

		//feeding mux_inputs, cntrl for sel, and the output being stored int
		eight_one_mux mux_inst (.d(mux_inputs), .sel(cntrl), .eight_one_out(result[i])); 
	end
endgenerate

	
	zero z(.zr(result), .zeroFlag(zero)); //zero

	assign negative = result[63];
endmodule
	