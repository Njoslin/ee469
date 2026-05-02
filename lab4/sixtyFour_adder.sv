`timescale 1ns/10ps
module sixtyFour_adder(a,b, ac, result, cin, cout, overflow);
	//62 bit input for the adder
	input logic [63:0] a,b;
	//3 bit input for the alu control
	input logic [2:0] ac;
	//singular carry in bit, will come 0th adder, will instant in top level
	input logic cin;
	//1 bit cout, either 0 or 1, will carry into the last bit of the adder. instant in top level
	output logic cout;
	//final output of the adder, MSB and LSB will be instant in top level
	output logic [63:0] result;
	//internal carry for adders
	output logic overflow;
	
	logic [63:0] carri;
	
	//for easy swtich between add sub
	//internal wire for the two_one_mux for FIRST carry in
	logic cinBar, c_in, sel, not_ac2;
	//assign cinBar = ~cin;
	not #0.05 n1(cinBar, cin);
	//assign ~ac2
	not #0.05 n2(not_ac2, ac[2]);
	//determine the correct sel input to the mux
	and #0.05 g(sel, not_ac2, ac[1], ac[0]);
	
	two_one_mux boat(.sel(sel), .Qold(cin), .writeQ(cinBar), .out(c_in));
	
	//first adder gets its cin inverted or not
	aluAdder first(.a(a[0]), .b(b[0]), .ac(ac), .cin(c_in), .cout(carri[0]), .sum(result[0]));
	
	genvar i;
	
	generate 
	//starting at one since first adder was created earlier
		for(i = 1; i < 64; i++) begin: adders
			aluAdder z(.a(a[i]), .b(b[i]), .ac(ac), .cin(carri[i-1]), .cout(carri[i]), .sum(result[i]));
		end
	endgenerate
	
	
	
	//tests for carryout
	//xoring the last carry in into adder 63 and carry out of the last bit.
	xor #0.05 over(overflow, carri[62], carri[63]);
	
	assign cout = carri[63];
	
	
endmodule

	
	
	