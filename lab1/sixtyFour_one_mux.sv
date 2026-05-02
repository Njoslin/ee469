`timescale 1ns/10ps
module sixtyFour_one_mux(data_in, data_out, sel);
	input logic [31:0][63:0]data_in ;
	input logic [4:0] sel;
	output logic [63:0] data_out;
	
	//logic for transposing, turning 32x64 into 64x32
	logic [63:0][31:0] new_column;
		genvar i,j;
	
	generate
		//outer for loop goes through 64 iterations, for 64x32x1 muxes
		
		//row for old matrix
		for (i = 0; i < 64; i++) begin: muxes	
			//for each mux, we have 32 inputs, one for each register.
			//column for old matrix
			for (j = 0; j < 32; j++) begin: registers
			//transposing to avoid overwriting each column for the 32 register connections to each of the 64 muxes
				assign new_column[i][j] = data_in[j][i];
			end
			//instatiating the 32x1 mux
				thirtyTwo_mux a(.d(new_column[i]), .sel(sel), .thirtyTwo_out(data_out[i]));
		end
	endgenerate
endmodule
	