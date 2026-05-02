//works
`timescale 1ns/10ps
module four_one_mux(d, sel, four_one_out);
	input logic [3:0] d;
	input logic [1:0] sel;
	output logic four_one_out;
	
	logic ftm_out1, ftm_out2;
	
	two_one_mux a(.Qold(d[0]), .writeQ(d[1]), .sel(sel[0]), .out(ftm_out1));
	two_one_mux b(.Qold(d[2]), .writeQ(d[3]), .sel(sel[0]), .out(ftm_out2));
	two_one_mux c(.Qold(ftm_out1), .writeQ(ftm_out2), .sel(sel[1]), .out(four_one_out));
	
endmodule

	