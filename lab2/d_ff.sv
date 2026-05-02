 //works no delays needed.
`timescale 1ns/10ps
 module d_ff (q, d, reset, clk);
		output logic q; 
		input logic d, reset, clk; 
		
	always_ff @(posedge clk) 
		if (reset) 
			q <= 0; // On reset, set to 0 
		else 
			q <= d; // Otherwise out = d. q remains the same if enable is false
endmodule
 