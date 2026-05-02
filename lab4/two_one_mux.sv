`timescale 1ns/10ps
//not #50; not1(sb, sel);


//Qold is when sel == 0
//writeQ is when sel == 1
module two_one_mux(writeQ, Qold, sel, out);

	input logic writeQ, Qold, sel; 
	output logic out;
	
		logic sb, a, b;
		//if enable is 0
		not #0.05 notGate(sb, sel);
		//if, sb is true and old data is true
		and #0.05 andGate1(a, sb, Qold);
		//if enable is true, then write new data
		and #0.05 andGate2(b, sel, writeQ);
		
		or #0.05 orGate(out, a, b);
	
endmodule

	