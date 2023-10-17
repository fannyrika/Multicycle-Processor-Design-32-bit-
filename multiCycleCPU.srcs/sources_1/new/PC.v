`timescale 1ns / 1ps

module PC(
    input clk, Reset, PCWre,
    input [1:0] PCSrc,  
    input [31:0] immediate,
    input [31:0] dataFromRF,
    output reg [31:0] newaddress,  
    output reg [31:0] address
    );  
    initial begin
        address = 0;
        newaddress = 4;
    end
    
    always @(posedge clk or negedge Reset)  //ÉèÖÃÊ±ÖÓ
    begin  
        if (Reset == 0) begin  
            address <= 0;  
            newaddress <= 4;
        end  
        else if (PCWre) begin
            if (PCSrc == 2'b11) begin  //j,jalÖ¸Áî
                address <= (newaddress[31:28]<<28)+(immediate[27:2]<<2)+2'b00; 
            end
            else if (PCSrc == 2'b01) begin  //beq or bne
                address <= newaddress + (immediate<<2);
            end
            else if (PCSrc == 2'b10) //jr
                address <= dataFromRF;
            else address = address + 4;
            newaddress <= address + 4;
        end  
    end  
endmodule  

