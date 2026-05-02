`timescale 1ns/10ps
module eight_one_mux_testbench;
	logic [7:0] d;
	logic [2:0] sel; 
	logic eight_one;
	
	initial begin
		d = 8'b00000010; sel = 3'b001; #10;
		d = 8'b11111101; sel = 3'b001; #10;
	
		d = 8'b10000000; sel = 3'b111; #10;
		d = 8'b01111111; sel = 3'b111; #10;
	
		
	end
	
eight_one_mux dut(.d(d), .sel(sel), .eight_one_out(eight_one));

endmodule
