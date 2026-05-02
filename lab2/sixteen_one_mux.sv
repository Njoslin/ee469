`timescale 1ns/10ps
module sixteen_one_mux(d, sel, sixteen_one_out);
	input logic [15:0] d;
	input logic [3:0] sel;
	
	output logic sixteen_one_out;
	
	logic [1:0] stm;
	
	eight_one_mux a(.d(d[7:0]), .sel(sel[2:0]), .eight_one_out(stm[0]));
	eight_one_mux b(.d(d[15:8]), .sel(sel[2:0]), .eight_one_out(stm[1]));
	two_one_mux c(.Qold(stm[0]), .writeQ(stm[1]), .sel(sel[3]), .out(sixteen_one_out));
	
	endmodule
	