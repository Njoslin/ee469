`timescale 1ns/10ps
module thirtyTwo_mux(d, sel, thirtyTwo_out);
	input logic [31:0] d;
	input logic [4:0] sel;
	output logic thirtyTwo_out;
	
	logic [1:0] ttm;
	
	sixteen_one_mux a(.d(d[15:0]), .sel(sel[3:0]), .sixteen_one_out(ttm[0]));
	sixteen_one_mux b(.d(d[31:16]), .sel(sel[3:0]), .sixteen_one_out(ttm[1]));
	
	two_one_mux c(.Qold(ttm[0]), .writeQ(ttm[1]), .sel(sel[4]), .out(thirtyTwo_out));
	
endmodule
