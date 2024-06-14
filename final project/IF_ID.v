`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2022 02:34:05 PM
// Design Name: 
// Module Name: IF_ID
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


//module description: instruction fetch to instruction decode
module IF_ID(clk,pc_in,inst_in,pc_out,inst_out);

input clk;
input [31:0] pc_in;
input [31:0] inst_in;

output reg [31:0] inst_out;
output reg [31:0] pc_out;

always@(posedge clk)
begin
    pc_out=pc_in;
    inst_out = inst_in;
end
endmodule