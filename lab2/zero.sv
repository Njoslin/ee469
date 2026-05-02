//FLAG
`timescale 1ns/10ps
module zero (zr, zeroFlag);
	input logic [63:0] zr;
	output logic zeroFlag;
	
	logic [15:0] hold;
	logic [3:0] sh;
	
	//first cascade
	or #0.05 a(hold[0], zr[0], zr[1], zr[2], zr[3]);
	or #0.05 b(hold[1], zr[4], zr[5], zr[6], zr[7]);
	or #0.05 c(hold[2], zr[8], zr[9], zr[10], zr[11]);
	or #0.05 d(hold[3], zr[12], zr[13], zr[14], zr[15]);
	
	or #0.05 e(hold[4], zr[16], zr[17], zr[18], zr[19]);
	or #0.05 f(hold[5], zr[20], zr[21], zr[22], zr[23]);
	or #0.05 g(hold[6], zr[24], zr[25], zr[26], zr[27]);
	or #0.05 h(hold[7], zr[28], zr[29], zr[30], zr[31]);
	
	or #0.05 i(hold[8], zr[32], zr[33], zr[34], zr[35]);
	or #0.05 j(hold[9], zr[36], zr[37], zr[38], zr[39]);
	or #0.05 k(hold[10], zr[40], zr[41], zr[42], zr[43]);
	or #0.05 l(hold[11], zr[44], zr[45], zr[46], zr[47]);
	
	or #0.05 m(hold[12], zr[48], zr[49], zr[50], zr[51]);
	or #0.05 n(hold[13], zr[52], zr[53], zr[54], zr[55]);
	or #0.05 o(hold[14], zr[56], zr[57], zr[58], zr[59]);
	or #0.05 p(hold[15], zr[60], zr[61], zr[62], zr[63]);	
	
	//second cascade
	or #0.05 q(sh[0], hold[0], hold[1], hold[2], hold[3]);
	or #0.05 r(sh[1], hold[4], hold[5], hold[6], hold[7]);
	or #0.05 s(sh[2], hold[8], hold[9], hold[10], hold[11]);
	or #0.05 t(sh[3], hold[12], hold[13], hold[14], hold[15]);
	
	//end
	nor #0.05 u(zeroFlag, sh[0], sh[1], sh[2], sh[3]);
	
endmodule
	