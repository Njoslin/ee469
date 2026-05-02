`timescale 1ns/10ps
module aluAdder(a, b, cin, cout, sum, ac);
	input logic a, b, cin;
	input logic [2:0] ac;
	output logic cout, sum;
	
	logic sel, b_invert, b_out, not_ac2; //b_out is the output if 2:1 mux
	
	//getting the invert of b
	not #0.05 n1(b_invert, b);
	not #0.05 n2(not_ac2, ac[2]);
	
	and #0.05 g(sel, not_ac2, ac[1], ac[0]); //if sel == 0  then add, if sel == 1, then subtract --> b = ~b
	
	two_one_mux boat(.sel(sel), .Qold(b), .writeQ(b_invert), .out(b_out)); //b_out is either b or ~b
	
	oneBitAdder fullAdd(.a(a), .b(b_out), .cin(cin), .cout(cout), .sum(sum));
	
endmodule

	
	
	
	
	
	