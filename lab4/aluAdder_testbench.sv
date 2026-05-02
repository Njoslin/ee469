`timescale 1ns/10ps

module aluAdder_testbench;

	logic a,b,cin;
	logic cout, sum;
	logic [2:0] ac;
	
	
	initial begin
		a = 0; b = 0; cin = 1; ac = 3'b011;  #1000; //doing subtraction
		a = 0; b = 1; cin = 1; ac = 3'b011;  #1000;
		a = 1; b = 0; cin = 1; ac = 3'b011;  #1000;
		a = 1; b = 1; cin = 1; ac = 3'b011;  #1000;
		
		a = 0; b = 1; cin = 0; ac = 3'b010;  #1000; //doing addition
		a = 0; b = 1; cin = 1; ac = 3'b010;  #1000;
		a = 1; b = 1; cin = 0; ac = 3'b010;  #1000;
		a = 1; b = 1; cin = 1; ac = 3'b010;  #1000;
	end
	
	aluAdder dut(.a(a), .b(b) , .cin(cin), .cout(cout), .sum(sum), .ac(ac));

endmodule
