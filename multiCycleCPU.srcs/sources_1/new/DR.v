`timescale 1ns / 1ps


module DR(
    input clk,
    input [31:0] in,
    output reg [31:0] out
    );
    //时钟上升沿时将数据送出
    always @(posedge clk) begin
        out = in;
    end
endmodule
