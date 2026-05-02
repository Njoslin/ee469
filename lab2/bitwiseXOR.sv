//inputs readData 1 and 2
`timescale 1ns/10ps
module bitwiseXOR(readData1, readData2, result,a);
	input logic [63:0] readData1, readData2;
	input logic [2:0] a; 
	output logic [63:0] result; 
	
	logic [63:0] temp;
	
	logic enable, not_ac0;
	
	not #0.05 n2(not_ac0, a[0]);
	
	and c(enable, a[2], a[1], not_ac0);
	
		genvar i;
		
		generate
		
		for(i = 0; i < 64; i++) begin: copyBits
			xor #0.05 b(temp[i], readData1[i], readData2[i]);
			//ensuring that enable is true and correct control is enabled
			and #0.05 d(result[i], temp[i], enable);
		end
	endgenerate
endmodule
