`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2022 01:20:31 PM
// Design Name: 
// Module Name: DataMemory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module instructionMemory(clock, pc, instruction);
    //inputs
    input clock;
    input [7:0] pc;
    //outputs
    output reg [31:0] instruction;
    //2D array w/ depth of 256
    wire [31:0] instr [0:255];
    
    //Demo Test (not for real demo, comment out when demo for real)
    /*assign instr[0] = 32'b11110000010000000000000001100100; //SVPC x1, 0x100
    assign instr[1] = 32'b01010000100000010000000000000000; //Inc, x2, x1
    assign instr[2] = 32'b01100000110000010000000000000000; //Neg x3, x1
    assign instr[3] = 32'b11110010100000000000000000000110; //SVPC x10, 6(instr# of ST - instr# of this instr)
    assign instr[4] = 32'b10110000000010100000000000000000; //BRN x10
    assign instr[5] = 32'b00000000000000000000000000000000; //NOP 
    assign instr[6] = 32'b00000000000000000000000000000000; //NOP
    assign instr[7] = 32'b00000000000000000000000000000000; //NOP
    assign instr[8] = 32'b01010000100000100000000000000000; //Inc x2, x2
    assign instr[9] = 32'b00110000010000010000000000000000; //ST x1, x1
    assign instr[10] = 32'b11100001000000010000000000000000; //Load x4, x1
    assign instr[11] = 32'b01000001010000010000100000000000;    //Add x5, x1, x2
    assign instr[12] = 32'b01110001100001000000001000000000;    //SUB x6, x4, x1
    assign instr[13] = 32'b11110010110000000000000000000011;    //SVPC x11, 3 (16-13, we want to get to 16)
    assign instr[14] = 32'b10010010110000000000000000000000;    //BRZ x11
    assign instr[15] = 32'b01010000100000100000000000000000;    //Inc x2, x2
    assign instr[16] = 32'b10100000010000000000000000000000;    //JM x1 (JumpMem)
    assign instr[17] = 32'b00000000000000000000000000000000;    //NOP
    assign instr[18] = 32'b00000000000000000000000000000000;    //NOP
    assign instr[19] = 32'b00000000000000000000000000000000;    //NOP
    assign instr[20] = 32'b10000000010000000000000000000000;    //J x1 (Jump)*/
    
    //The real demo instructions
    assign instr[0] = 32'b01110001000000100000100000000000; //SUB x4, x4,x4
    assign instr[1] = 32'b01000001010000100000110000000000; // ADD x5,x2,x3
    assign instr[2] = 32'b11110010010000010000000000000000; //SVPC x9,1
    assign instr[3] = 32'b11100001100000100000000000000000; //LOAD x6,x2  (start of loop)
    assign instr[4] = 32'b00000000000000000000000000000000; //NOP
    assign instr[5] = 32'b00000000000000000000000000000000; //NOP
    assign instr[6] = 32'b00000000000000000000000000000000; //NOP
    assign instr[7] = 32'b01000001000001000001100000000000;  //ADD x4,x4,x6
    assign instr[8] = 32'b01010000100000100000010000000000;   //INC x2,x2,x1
    assign instr[9] = 32'b00000000000000000000000000000000;   //NOP
    assign instr[10] = 32'b00000000000000000000000000000000;   //NOP
    assign instr[11] = 32'b00000000000000000000000000000000;   //NOP
    assign instr[12] = 32'b01110010000000100001010000000000;   //SUB x8,x2,x5
    assign instr[13] = 32'b10110010010000000000000000000000;   //BRN x9
    assign instr[14] = 32'b10010010010000000000000000000000;   //BRZ x9
    /*assign instr[15] = 32'b
    assign instr[16] = 32'b
    assign instr[17] = 32'b
    assign instr[18] = 32'b
    assign instr[19] = 32'b
    assign instr[20] = 32'b*/
    
    
    always @ (posedge clock) 
    begin
        instruction = instr[pc];
    end
    
endmodule


module registerFile(clock, regWrite, rs, rt, wrtAddress, Data, rsOut, rtOut);
    //inputs
    input clock;
    input regWrite;
    input [5:0] rs;
    input [5:0] rt;
    input [5:0] wrtAddress;
    input [31:0] Data;
    //outputs
    output reg [31:0] rsOut;
    output reg [31:0] rtOut;
    //register array
    reg [31:0] regArray [63:0];
    
   /* initial begin
    regArray[0] = 0;
    regArray[2] = 15;
    regArray[3] = 3;
    end
    */
    always @ (posedge clock)
    begin
        if(regWrite == 1)
            regArray[wrtAddress] <= Data;
        else
        begin
            rsOut = regArray[rs];
            rtOut = regArray[rt];
        end
    end
endmodule


module dataMemory(clock, memWrite, memRead, inputAddr, data_in, data_out);
    //inputs
    input clock;
    input memWrite;
    input memRead;
    input [31:0] inputAddr;
    input [31:0] data_in;
    //output
    output reg [31:0] data_out;
    
    //2-d array
    //changed from reg [31:0] memory [65535:0]; because error message says it is too much
    reg [31:0] memory [127:0];
    
    initial
    begin
        memory[15] = 5;
        memory[16] = 25;
        memory[17] = 10;
        memory[18] = 15;
    end
    
    always @ (posedge clock) 
    begin
        if (memWrite == 1) begin
            memory[inputAddr[15:0]] = data_in;
        end
        if (memRead == 1) begin
            data_out = memory[inputAddr[15:0]];
        end
    end
    
endmodule
