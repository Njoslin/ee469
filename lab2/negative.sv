//useless lmao
`timescale 1ns/10ps
module negative(result, negativeFlag);
	//take the 64 bit input 
	input logic [63:0] result; 
	output logic negativeFlag;
	
	//assign negativeFlag to the MSB of result
	assign negativeFlag = result[63];
	
endmodule
