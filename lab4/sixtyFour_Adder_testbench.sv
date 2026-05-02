`timescale 1ns/10ps
module sixtyFour_Adder_testbench;
	 //inputs
	 logic [63:0] a,b;
	 logic [2:0] ac;
	 logic cin;
	 
	 //outputs
	 logic cout;
	 logic [63:0] result;
	 logic overflow, negative;
	 
	 initial begin
		a = 64'd10 ; b = 64'd20; cin = 0; ac = 3'b010; #1000;//overflow = 0, negative = 0
		a = 64'd5 ; b = 64'd1; cin = 0; ac = 3'b011; #1000;//overflow = 0, negative = 0
	end
	
	sixtyFour_adder dut(.a(a), .b(b), .ac(ac), .cin(cin), .cout(cout), .result(result), .overflow(overflow), .negative(negative));
	
endmodule


