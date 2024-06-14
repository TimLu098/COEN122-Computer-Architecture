`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2022 03:43:35 PM
// Design Name: 
// Module Name: control
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

//for ALU control, inputs are add, inc, neg, sub (in that order). Control unit will output
//a 4-bit ALUOp code for those four control lines for the ALU control?
//1000 = Add, 0100 = increment, 0010 = negate (2's comp), 0001 = subtract,
//1111 = pass A, and 0000 = No Operation (nop)
module control(opcode, RegWrite, MemToReg, PCToReg, BranchN, BranchZ, Jump, JumpMem, MemRead, MemWrite, ALUOp, ALUMux);
    //input is 4-bit opcode from inst[3:0] (from project description)
    input [3:0] opcode;
    //output
    output reg RegWrite;
    output reg MemToReg;
    output reg PCToReg;
    output reg BranchN;
    output reg BranchZ;
    output reg Jump;
    output reg JumpMem;
    output reg MemRead;
    output reg MemWrite;
    output reg [3:0] ALUOp;
    output reg ALUMux;  //control line for the mux infront of ALU
    
    always @ (opcode)
    case(opcode)
        4'b0000:begin     //No ooperation
                    RegWrite = 0;
                    MemToReg = 0;
                    PCToReg = 0;
                    BranchN = 0;
                    BranchZ = 0;
                    Jump = 0;
                    JumpMem = 0;
                    MemRead = 0;
                    MemWrite = 0;
                    ALUOp = 4'b0000;    //no op for ALUOp because don't care about ALU output
                    ALUMux = 0;
                end
        4'b1111:begin               //save PC
                    RegWrite = 1;
                    MemToReg = 0;
                    PCToReg = 1;
                    BranchN = 0;
                    BranchZ = 0;
                    Jump = 0;
                    JumpMem = 0;
                    MemRead = 0;
                    MemWrite = 0;
                    ALUOp = 4'b1111;    //no op for ALUOp because don't care about ALU output
                    ALUMux = 0;
                end
        4'b1110:begin               //Load
                    RegWrite = 1;
                    MemToReg = 1;
                    PCToReg = 0;
                    BranchN = 0;
                    BranchZ = 0;
                    Jump = 0;
                    JumpMem = 0;
                    MemRead = 1;
                    MemWrite = 0;
                    ALUOp = 4'b0000;    //no op for ALUOp because don't care about ALU output
                    ALUMux = 0;
                end
        4'b0011:begin               //Store  
                    RegWrite = 0;
                    MemToReg = 0;
                    PCToReg = 0;
                    BranchN = 0;
                    BranchZ = 0;
                    Jump = 0;
                    JumpMem = 0;
                    MemRead = 0;
                    MemWrite = 1;
                    ALUOp = 4'b0000;    //no op for ALUOp because don't care about ALU output
                    ALUMux = 0;
                end
        4'b0100:begin               //Add
                    RegWrite = 1;
                    MemToReg = 0;
                    PCToReg = 0;
                    BranchN = 0;
                    BranchZ = 0;
                    Jump = 0;
                    JumpMem = 0;
                    MemRead = 0;
                    MemWrite = 0;
                    ALUOp = 4'b1000;    //1000 means add 
                    ALUMux = 0;
                end
        4'b0101:begin               //Increment
                    RegWrite = 1;
                    MemToReg = 0;
                    PCToReg = 0;
                    BranchN = 0;
                    BranchZ = 0;
                    Jump = 0;
                    JumpMem = 0;
                    MemRead = 0;
                    MemWrite = 0;
                    ALUOp = 4'b0100;    //0100 means increment in ALU
                    ALUMux = 1;
                end
        4'b0110:begin               //Negate
                    RegWrite = 1;
                    MemToReg = 0;
                    PCToReg = 0;
                    BranchN = 0;
                    BranchZ = 0;
                    Jump = 0;
                    JumpMem = 0;
                    MemRead = 0;
                    MemWrite = 0;
                    ALUOp = 4'b0010;    //0010 means negate in ALU
                    ALUMux = 0;         
                end
        4'b0111:begin               //Subtract (R-type for Control truth table?)
                    RegWrite = 1;
                    MemToReg = 0;
                    PCToReg = 0;
                    BranchN = 0;
                    BranchZ = 0;
                    Jump = 0;
                    JumpMem = 0;
                    MemRead = 0;
                    MemWrite = 0;
                    ALUOp = 4'b0001;    //0001 means subtract in ALU code
                    ALUMux = 0;
                end
        4'b1000:begin               //Jump
                    RegWrite = 0;
                    MemToReg = 0;
                    PCToReg = 0;
                    BranchN = 0;
                    BranchZ = 0;
                    Jump = 1;
                    JumpMem = 0;
                    MemRead = 0;
                    MemWrite = 0;
                    ALUOp = 4'b1111;    //1111 means Pass A in ALU code
                    ALUMux = 0;
                end
        4'b1001:begin               //Branch if Zero (Like beq in control truth table?)
                    RegWrite = 0;
                    MemToReg = 0;
                    PCToReg = 0;
                    BranchN = 0;
                    BranchZ = 1;
                    Jump = 0;
                    JumpMem = 0;
                    MemRead = 0;
                    MemWrite = 0;
                    ALUOp = 4'b1111;    //1111 means Pass A in ALU code
                    ALUMux = 0;
                end
        4'b1010:begin               //Jump Memory
                    RegWrite = 0;
                    MemToReg = 0;
                    PCToReg = 0;
                    BranchN = 0;
                    BranchZ = 0;
                    Jump = 0;
                    JumpMem = 1;
                    MemRead = 1;
                    MemWrite = 0;
                    ALUOp = 4'b0000;    //0000 means no operation in ALU
                end
        4'b1011:begin               //Branch if Negative (Like beq in control truth table?)
                    RegWrite = 0;
                    MemToReg = 0;
                    PCToReg = 0;
                    BranchN = 1;
                    BranchZ = 0;
                    Jump = 0;
                    JumpMem = 0;
                    MemRead = 0;
                    MemWrite = 0;
                    ALUOp = 4'b1111;    //1111 means Pass A in ALU
                    ALUMux = 0;
                end
        /*4'b0001:begin               //Sum (special operation) Extra-credit
                    RegWrite = ;
                    MemToReg = ;
                    PCToReg = ;
                    BranchN = ;
                    BranchZ = ;
                    Jump = ;
                    JumpMem = ;
                    MemRead = ;
                    MemWrite = ;
                    ALUOp = 4'b;
                end*/
    endcase
endmodule
