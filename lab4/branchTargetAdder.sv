module branchTargetAddress(a, b, result, cin, cout);
	//64 bit input for the adder
	//a = pc_out, b = 4
	input logic [63:0] a,b;
	//singular carry in bit, will come 0th adder, will instant in top level
	input logic cin;
	//1 bit cout, either 0 or 1, will carry into the last bit of the adder. instant in top level
	output logic cout;
	//final output of the adder, MSB and LSB will be instant in top level
	output logic [63:0] result;
	//internal carry for adders
	logic [63:0] carri;
	
	
	
	//edit later
	
	//first cin always set to 0, since no subtraction
	oneBitAdder first(.a(a[0]), .b(b[0]), .cin(1'b0), .cout(carri[0]), .sum(result[0]));
	
	genvar i;
	
	generate 
	//starting at one since first adder was created earlier
		for(i = 1; i < 64; i++) begin: adders
			oneBitAdder z(.a(a[i]), .b(b[i]), .cin(carri[i-1]), .cout(carri[i]), .sum(result[i]));
		end
	endgenerate
	
endmodule