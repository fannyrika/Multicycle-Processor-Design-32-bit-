`timescale 1ns / 1ps


module key(

input clk_sys,
    input reset,
    input key,
    output debkey
    );

	reg key_rrr,key_rr,key_r;
	always @(posedge clk_sys or negedge reset) //È¥¶¶
		if(!reset)
			begin
				key_rrr <= 1'b1;
				key_rr <= 1'b1;
				key_r <= 1'b1;
			end
		else
			begin
				key_rrr <= key_rr;
				key_rr <= key_r;
				key_r <= key;
			end
	//---------------------------------------------------------------	
	assign debkey = key_rrr & key_rr & key_r;
endmodule
