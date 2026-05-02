`timescale 1ns/10ps
module adder_testbench;
	logic a,b,cin;
	logic cout, sum;
	
	
	initial begin
		a = 0; b = 0; cin = 0; #1000;
		a = 0; b = 0; cin = 1; #1000;
		a = 0; b = 1; cin = 0; #1000;
		a = 0; b = 1; cin = 1; #1000;
		a = 1; b = 0; cin = 0; #1000;
		a = 1; b = 0; cin = 1; #1000;
		a = 1; b = 1; cin = 0; #1000;
		a = 1; b = 1; cin = 1; #1000;
	end
	
	oneBitAdder dut(.a(a), .b(b) , .cin(cin), .cout(cout) ,.sum(sum));

endmodule
