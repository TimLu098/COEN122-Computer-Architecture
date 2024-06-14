`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Yen-Jung Lu
// 
// Create Date: 02/08/2022 04:31:53 PM
// Design Name: 
// Module Name: ID_EX
// Project Name: COEN122 Lab4
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

//module description: instruction decode to Execution
module ID_EX(clk, MemWrite, MemRead, ALUOP, JumpMem, Jump, BranchZero,BranchNeg, PCtoReg, MemToReg, RegWrite, rs, rt, rd, adder, signExtend, ALUMux, MemWrite_out, MemRead_out, ALUOP_out, JumpMem_out, Jump_out, BranchZero_out, BranchNeg_out, PCtoReg_out, MemToReg_out, RegWrite_out, rs_out, rt_out, rd_out, adder_out, signExtend_out, ALUMux_out); 

input clk;
input MemWrite;
input MemRead;
input [3:0]ALUOP;
input JumpMem;
input Jump;
input BranchZero;
input BranchNeg;
input PCtoReg;
input MemToReg;
input RegWrite;
input [31:0] rs;
input [31:0] rt;
input [5:0] rd;
input [31:0] adder;
input [31:0] signExtend;
input ALUMux;
//output

output reg MemWrite_out;
output reg MemRead_out;
output reg [3:0]ALUOP_out;
output reg JumpMem_out;
output reg Jump_out;
output reg BranchZero_out;
output reg BranchNeg_out;
output reg PCtoReg_out;
output reg MemToReg_out;
output reg RegWrite_out;
output reg [31:0] rs_out;
output reg [31:0] rt_out;
output reg [5:0] rd_out;
output reg [31:0] adder_out;
output reg [31:0] signExtend_out;
output reg ALUMux_out;

 //alu 4 bits 
//IMM GEN BE 32 bits ,pass in from instruciton memory



always@(posedge clk)
begin 
    MemWrite_out = MemWrite;
    MemRead_out = MemRead;
    ALUOP_out = ALUOP;
    JumpMem_out = JumpMem;
    Jump_out = Jump;
    BranchZero_out = BranchZero;
    BranchNeg_out = BranchNeg;
    PCtoReg_out = PCtoReg;
    MemToReg_out = MemToReg;
    RegWrite_out = RegWrite;
    rs_out = rs;
    rt_out = rt;
    rd_out = rd;
    adder_out = adder;
    signExtend_out = signExtend;
    ALUMux_out= ALUMux;
end
endmodule