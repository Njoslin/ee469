//inputs readData 1 and 2
`timescale 1ns/10ps
module bitwiseAnd(readData1, readData2, result, a);
	input logic [63:0] readData1, readData2;
	input logic [2:0] a; 
	output logic [63:0] result; 
	
	logic enable, not_ac0, not_ac1;
	
	not #0.05 n1(not_ac0, a[0]);
	not #0.05 n2(not_ac1, a[1]);
	
	
	and c(enable, a[2], not_ac1, not_ac0);
	
		genvar i;
		
		generate
		
		for(i = 0; i < 64; i++) begin: copyBits
			and #0.05 b(result[i], readData1[i], readData2[i], enable);
		end
	endgenerate
endmodule

	
	
	