`timescale 1ns/10ps
module four_one_mux_testbench;
	logic [3:0] d;
	logic [1:0] sel;
	logic four_out;
	
	initial begin
		d = 4'b0010; sel = 2'b01; #10;
		d = 4'b1101; sel = 2'b01; #10;
		
		d = 4'b1000; sel = 2'b11; #10;
		d = 4'b0111; sel = 2'b11; #10;
		
		
	end
	
	four_one_mux dut(.d(d), .sel(sel), .four_one_out(four_out));
	
	endmodule
	