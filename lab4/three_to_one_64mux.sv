module three_to_one_64mux(in0, in1, in2, sel, out);
	input logic [63:0] in0, in1, in2;
	input logic [1:0] sel;
	output logic [63:0] out;
	
	always_comb begin
		case(sel)
			2'b00: out = in0; //pc + 4
			2'b01: out = in1; //pc + offset
			2'b10: out = in2; //ReadData2
			default: out = in0; //just go sequentially
		endcase
	end
endmodule
	
	
			
	