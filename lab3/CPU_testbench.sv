`timescale 1ns/10ps
module CPU_testbench;
	logic reset, clk;

	parameter ClockDelay = 5000;

	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	CPU dut(.clk(clk), .reset(reset));

	// Clock generation
	initial begin
		clk = 0;
		forever #(ClockDelay/2) clk = ~clk;
	end

	// Test sequence
	initial begin
		reset <= 1'b1;
		@(posedge clk); #(ClockDelay); 
		repeat(3) @(posedge clk);
		reset <= 1'b0;
		@(posedge clk);
		#(ClockDelay * 100); // Run CPU for 100 clock cycles
		$stop;
	end
endmodule

