//works
`timescale 1ns/10ps
module two_one_mux_testbench;
	logic writeQ, enable, qold;
	//outputs
	logic ouT;
	
	initial begin
		writeQ = 1; qold = 0; enable = 0; #1000;//should output zero
		writeQ = 1; qold = 0; enable = 1; #1000;//should output one
		writeQ = 0; qold = 0; enable = 1; #1000;//should output one
		writeQ = 1; qold = 1; enable = 1; #1000;//should output one for writeQ
		
	end
	
	two_one_mux dut (.writeQ(writeQ), .Qold(qold), .sel(enable), .out(ouT));
	
endmodule

		