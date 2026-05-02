//works
`timescale 1ns/10ps
module decoder_testbench;
	logic en;
	logic [4:0] num;
	logic [31:0] regi;
	
	initial begin 
		en = 1; num = 5'b00001;	#10;//should outpu 32 bit 1
		en = 0; num = 5'b00001; #10;//should output zero
		en = 1; num = 5'b10000;	#10;//should outpu 32 bit 1
		en = 0; num = 5'b00000; #10;//should output zero
		
	end
	
	decoderLogic dut(.enable(en), .a(num), .r(regi));
endmodule
