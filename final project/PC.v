`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2022 02:33:00 PM
// Design Name: 
// Module Name: pc
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


  module pcModule(clock, pcIn, pcOut);
    //inputs
    input clock;
    //input [7:0] pcIn;         //input for saving PC and using 8 bits because that can cover up to 2^8 or 256 instructions
    input [31:0] pcIn;
    //outputs
    output reg [31:0] pcOut;       //output for outputing address to Inst-mem
    
    initial
    begin
        pcOut = 0;
    end
        
    always @ (negedge clock)
    begin
        if(pcIn)
            pcOut = pcIn;
    end
endmodule
