`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2022 02:57:27 PM
// Design Name: 
// Module Name: immGen
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


module signExtend(instIn, immOut);
    //inputs
    //input gen;              //Imm Gen control line?
    //input [21:0] instIn;    //22-bits from instruction given to the Imm Gen?
    input [31:0] instIn;        //the whole instruction is taken in
    //output
    output reg [31:0] immOut;   //32-bit immediate value out
    //sign extend value
    //reg [9:0] sign;
    //part of full instruction for either instruction
    reg [21:0] instInSVPC;  //take this part of instIn for SVPC instruction
    reg [15:0] instInInc;   //take this part of instIn for Icrement instruction
    
    //input is 22-bits? so sign extend the next 10 bits
    always @ (instIn)
    begin
        if (instIn[31:28] == 4'b1111) begin     //if opcode is opcode for SVPC
            //sign extend for SVPC has 22-bit input
            instInSVPC = instIn[21:0];
            if (instIn[21] == 1'b0) begin     //if MSB of instIn is 0, meaning input is positive
                immOut = {10'b0000000000, instInSVPC};  
                
                //not using sign because I would need two sign variables
                //sign = 10'b0000000000;
                //immOut = {sign, instIn};    //concatenate sign and input to make output
            end else begin                  //if MSB is 1, meaning input is negative
                immOut = {10'b1111111111, instInSVPC};
                
                //sign = 10'b1111111111;
                //immOut = {sign, instIn};
            end
        end
        if (instIn [31:28] == 4'b0101) begin    //if opcode is opcode for Increment
            //sign extend for Increment uses 16-bit input
            instInInc = instIn[15:0];
            if (instIn[15] == 1'b0) begin
                immOut = {16'b0000000000000000, instInInc};
            end else begin
                immOut = {16'b1111111111111111, instInInc};
            end
        end
        /*if (instIn[21] == 1'b0) begin     //if MSB of instIn is 0, meaning input is positive
            sign = 10'b0000000000;
            immOut = {sign, instIn};    //concatenate sign and input to make output
        end else begin                  //if MSB is 1, meaning input is negative
            sign = 10'b1111111111;
            immOut = {sign, instIn};
        end*/
    end
endmodule
