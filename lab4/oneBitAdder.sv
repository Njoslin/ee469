`timescale 1ns/10ps
module oneBitAdder (a, b, cin, cout, sum);
	//b will be driven by the aluAdder
	input logic a,b,cin;
	output logic cout, sum;
	
	logic abar, bbar, cinbar;
	not #0.05 n1(abar, a);
	not #0.05 n2(bbar, b);
	not #0.05 n3(cinbar, cin);
	
	logic [3:0] x; 
	logic [3:0] p;
	
	//carry out
	and #0.05 a1(x[0], abar, b, cin);
	and #0.05 b1(x[1], a, bbar, cin);
	and #0.05 c(x[2], a, b, cinbar);
	and #0.05 c1(x[3], a, b, cin);
	or #0.05 d(cout, x[3], x[2], x[1], x[0]);
	
	//sum
	and #0.05 e(p[0], abar ,bbar, cin);
	and #0.05 f(p[1], abar ,b, cinbar);
	and #0.05 g(p[2], a ,bbar, cinbar);
	and #0.05 h(p[3], a ,b, cin);
	or #0.05 i(sum, p[3], p[2], p[1], p[0]);

endmodule
	
	
	