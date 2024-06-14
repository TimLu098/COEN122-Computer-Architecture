`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2022 10:30:58 AM
// Design Name: 
// Module Name: data
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


module data(clock,read,write,addressin,datain,dataout);

input clock;
input write;
input read;

reg [31:0] mem [65535:0];

input [31:0] addressin;
input [31:0] datain;

output reg [31:0] dataout;

always@(posedge clock)
begin
    //read data from blocks[i] into dataout
    if (read == 1)
    begin
    
        dataout = mem[addressin[15:0]];
        
    end
    
    //write data from writein into blocks[i]
    if (write == 1)
    begin
    
        mem[addressin[15:0]] = datain;
    
    end
    

end
endmodule
