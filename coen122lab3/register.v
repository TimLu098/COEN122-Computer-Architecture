`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2022 10:30:38 AM
// Design Name: 
// Module Name: register
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


module register(clock,write,rd,rs,rt,writein,rsout,rtout);

input clock;
input write;

input [5:0] rd;
input [5:0] rs;
input [5:0] rt;
input [31:0] writein;
//init static memory
reg [31:0] regis [63:0];

output reg [31:0] rsout;
output reg [31:0] rtout;

always@(posedge clock)
begin
   
    if (write == 1)
        
        regis[rt] = writein;
    
    else if (write == 0)
    begin
    
    
    rsout = regis[rd];
    rtout = regis[rs];
   
    
    end


end
endmodule
