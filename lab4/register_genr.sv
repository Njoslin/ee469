`timescale 1ns/10ps
module register_genr(clk, reset, D, Q, en);
	input logic clk, reset, en;
	input logic [63:0] D;
	output logic [63:0] Q;
	
	//this creates on single register that is 64 bits long
	genvar i; 
	
	generate
	
		for(i = 0; i < 64; i++)begin : eachDff
		
			enable_dff enableInst(.clk(clk), .writeData(D[i]), .q(Q[i]), .reset(reset), .enable(en));
			
			end
			
		endgenerate

endmodule
	
	

	