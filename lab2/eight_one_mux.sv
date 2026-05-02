`timescale 1ns/10ps
module eight_one_mux(d, sel, eight_one_out);
	input logic [7:0] d;
	input logic [2:0] sel; 
	output logic eight_one_out;
	
	logic [1:0] etm;
	
	
	four_one_mux a(.d(d[3:0]), .sel(sel[1:0]), .four_one_out(etm[0]));
	four_one_mux b(.d(d[7:4]), .sel(sel[1:0]), .four_one_out(etm[1]));
	
	two_one_mux c(.Qold(etm[0]), .writeQ(etm[1]), .sel(sel[2]), .out(eight_one_out));
	
	endmodule
