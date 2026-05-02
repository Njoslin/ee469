`timescale 1ns/10ps
module sixteen_one_mux_testbench;
	logic [15:0] d;
	logic [3:0] sel;
	
	logic sixteen_one;
	
	
	initial begin
		d = 16'b0000000000000010; sel = 4'b0001; #10;
		d = 16'b1111111111111101; sel = 4'b0001; #10;
	
		d = 16'b1000000000000000; sel = 4'b1111; #10;
		d = 16'b0111111111111111; sel = 4'b1111; #10;
	
		
	end
	
	sixteen_one_mux dut(.d(d), .sel(sel), .sixteen_one_out(sixteen_one));
	
	endmodule
	