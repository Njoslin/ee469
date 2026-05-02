module flipflop_enable(writeQ, Qold, sel, out);
	
	//2:1 mux
	//sel = enable
	input logic writeQ, Qold, sel; //selector;
	output logic out;
	
		logic sb, a, b;
		//if enable is 0
		not(sb, sel);
		//if, sb is true and old data is true
		and(a, sb, Qold);
		//if enable is true, then write new data
		and(b, sel, writeQ);
		or(out, a, b);
	
endmodule

	