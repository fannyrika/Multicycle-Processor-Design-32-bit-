`timescale 1ns / 1ps

module signZeroExtend(
    input [15:0] immediate,
    input ExtSel,
    output [31:0] out
    );
    //��������չ
    assign out[15:0] = immediate;
    assign out[31:16] = ExtSel? (immediate[15]? 16'hffff : 16'h0000) : 16'h0000;
endmodule