`timescale 1ns / 1ps


module controlUnit(
    input clk,
    input [5:0] opCode,
    input zero,
    input sign,
    input RST,
    output IRWre,
    output PCWre,
    output ALUSrcA,
    output ALUSrcB,
    output DBDataSrc,
    output RegWre,
    output WrRegDSrc,
    output InsMemRW,
    output mRD,
    output mWR,
    output ExtSel,
    output [1:0] RegDst,
    output [1:0] PCSrc,
    output [2:0] ALUOp
    );
   wire [2:0] state;
   //�ı䵱ǰ״̬
   changeState CSt(opCode,RST,clk,state);
   //��������ź�
   controlSign CSi(state,opCode,zero,sign,IRWre,PCWre,ALUSrcA,ALUSrcB,DBDataSrc,RegWre,WrRegDSrc,InsMemRW,mRD,mWR,ExtSel,RegDst,PCSrc,ALUOp);
   
endmodule