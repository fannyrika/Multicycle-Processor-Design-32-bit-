`timescale 1ns / 1ps


module mux(
    input [31:0] aluResult,
    input zero,
    input sign,
    input [5:0] opCode,
    output reg[31:0] writeData
    );
    //����bne,beq,bltzָ��
    always @(aluResult or zero or opCode ) begin
        if (opCode == 6'b110101) //bne
            writeData = !zero;
        else if (opCode == 6'b110100)//beq
            writeData = zero;
        else if (opCode == 6'b110110)//bltz
            writeData = sign;
        else
            writeData = aluResult;
    end
endmodule
