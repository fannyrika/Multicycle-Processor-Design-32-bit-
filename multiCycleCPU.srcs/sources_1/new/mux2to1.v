`timescale 1ns / 1ps


module mux2to1(
    input [31:0] in1,
    input [31:0] in2,
    input sign,
    output [31:0] out
    );
    //ถþักาป
    assign out = (sign == 0)? in1 : in2;
endmodule
