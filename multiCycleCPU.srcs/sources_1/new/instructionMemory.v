`timescale 1ns / 1ps

module instructionMemory(
    input [31:0] pc,   
    output [31:0] instruction
    );
    
    reg [7:0] mem[0:127];
    reg [31:0] address;
    reg [31:0] instruction;
    initial begin
        $readmemb("C:/Users/Administrator/Desktop/Co-homework-master/multiCycleCPU/instructions.txt", mem); 
    end
    
    always @(pc) begin //∂¡»°÷∏¡Ó
        address = pc[6:2] << 2; 
        instruction = (mem[address]<<24) + (mem[address+1]<<16) + (mem[address+2]<<8) + mem[address+3];
    end

    
endmodule