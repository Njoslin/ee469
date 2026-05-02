//inputs readData 1 and 2
`timescale 1ns/10ps
module bitwiseOr(readData1, readData2, result, a);
	input logic [63:0] readData1, readData2;
	input logic [2:0] a; 
	output logic [63:0] result; 
	
	logic [63:0] temp;
	
	logic enable, not_ac1;
	
	not #0.05 n2(not_ac1, a[1]);
	
	and c(enable, a[2], not_ac1, a[0]);
	
		genvar i;
		
		generate
		
		for(i = 0; i < 64; i++) begin: copyBits
			or #0.05 b(temp[i], readData1[i], readData2[i]);
			and #0.05 d(result[i], temp[i], enable);
			
		end
	endgenerate
endmodule
