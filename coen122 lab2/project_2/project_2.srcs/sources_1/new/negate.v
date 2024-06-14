`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2022 03:03:15 PM
// Design Name: 
// Module Name: negate
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


module negate(A,out);
input [31:0]A;

output[31:0] out;

not(out[0],A[0]);
not(out[1],A[1]);
not(out[2],A[2]);
not(out[3],A[3]);
not(out[4],A[4]);
not(out[5],A[5]);
not(out[6],A[6]);
not(out[7],A[7]);
not(out[8],A[8]);
not(out[9],A[9]);
not(out[10],A[10]);
not(out[11],A[11]);
not(out[12],A[12]);
not(out[13],A[13]);
not(out[14],A[14]);
not(out[15],A[15]);
not(out[16],A[16]);
not(out[17],A[17]);
not(out[18],A[18]);
not(out[19],A[19]);
not(out[20],A[20]);
not(out[21],A[21]);
not(out[22],A[22]);
not(out[23],A[23]);
not(out[24],A[24]);
not(out[25],A[25]);
not(out[26],A[26]);
not(out[27],A[27]);
not(out[28],A[28]);
not(out[29],A[29]);
not(out[30],A[30]);
not(out[31],A[31]);

fullAdder add_neg(out,1,cout,sum);
//negA,1,cout,out

endmodule
