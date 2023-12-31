`timescale 1ns / 1ps


module IR(
    input clk,
    input IRWre,
    input [31:0] instruction,
    output reg[5:0] op,   
    output reg[4:0] rs, rt, rd,  
    output reg[15:0] immediate,
    output reg[5:0] sa
    );
    
    //时钟上升沿时送出数据
    always @(posedge clk) begin
        if (IRWre == 1) begin
            op = instruction[31:26];  
            rs = instruction[25:21];  
            rt = instruction[20:16];  
            rd = instruction[15:11];  
            sa = instruction[10:6];
            immediate = instruction[15:0];
        end
    end
endmodule
