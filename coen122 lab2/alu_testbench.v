`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2022 02:54:51 PM
// Design Name: 
// Module Name: alu_testbench
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


module alu_testbench();
    reg[31:0]A;
    reg[31:0]B;
    reg add,inc,neg,sub;
    wire [31:0]out;
    wire Z,N;
    
    ALU t1(A,B,add,inc,neg,sub,out,Z,N);
    
    initial
    begin
    A= 32'b00000000000000000000000000000001;
    B= 32'b00000000000000000000000000000001;
   
   //add
   add=1;
   neg=0;
   sub=0;
   inc=0;
   #100
   
   //increment
   add=0;
   neg=0;
   sub=0;
   inc=1;
   #100
   
   //negate
   add=0;
   neg=1;
   sub=0;
   inc=0;
   #100
   
   //subtract
   add=0;
   neg=0;
   sub=1;
   inc=0;
   #100
   
   
   //passA
   add=1;
   neg=1;
   sub=1;
   inc=1;
   #100
   
   $finish;
   end
endmodule