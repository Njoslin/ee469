//RESULT
`timescale 1ns/10ps
module passB(a, readData, bus_64);
	input logic [2:0] a;
	input logic [63:0] readData;
	output logic [63:0] bus_64;
	
	//we need an enable here b/c if not, we will always pass B
	logic enable, not_ac0, not_ac1, not_ac2;
	not #0.05 n1(not_ac0, a[0]);
	not #0.05 n2(not_ac1, a[1]);
	not #0.05 n3(not_ac2, a[2]);
	
	and #0.05 c(enable, not_ac0, not_ac1, not_ac2);
	
	//copy readData array into bus_64
	
		genvar i;
	
		generate
	
		for(i = 0; i <64; i++) begin: copyBits
			and #0.05 b(bus_64[i], enable, readData[i]);
		end
	endgenerate
	
endmodule
	
	