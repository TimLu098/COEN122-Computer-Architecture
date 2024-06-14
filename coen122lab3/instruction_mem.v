`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2022 10:30:14 AM
// Design Name: 
// Module Name: instruction_mem
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


module instruction_mem(clock,address8,ins);


input clock;
input [7:0]address8;
output reg [31:0] ins;


//init static memory
wire [31:0] instruc [255:0];

//hardcode instructions
assign instruc[100] = 11;
assign instruc[101] = 12;


always@(posedge clock)
begin
   //read instructions[i] into output ins
   ins = instruc[address8];

end

endmodule