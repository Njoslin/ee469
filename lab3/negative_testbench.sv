`timescale 1ns/10ps
module negative_testbench;
	logic [63:0] result;
	logic negativeFlag;
	
	negative dut (.result(result), .negativeFlag(negativeFlag));
	
	initial begin 
		
		//Postive Test
		result = 64'b1; #1000;
		
		//Zero Test
		result = 64'b0; #1000;
	
		result = ~64'd1 + 64'd1; #1000;
		
		result = ~64'd2 + 64'd1; #1000;
		
		result = ~64'd3 + 64'd1; #1000;
		
		result = ~64'd4 + 64'd1; #1000;
		
		result = ~64'd5 + 64'd1; #1000;
		
		result = ~64'd6 + 64'd1; #1000;
		
		result = ~64'd7 + 64'd1; #1000;
		
		result = ~64'd8 + 64'd1; #1000;
		
		result = ~64'd9 + 64'd1; #1000;
		
		result = ~64'd10 + 64'd1; #1000;
		
	end
endmodule
