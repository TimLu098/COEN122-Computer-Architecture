`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2022 03:13:35 AM
// Design Name: 
// Module Name: signExtenderAdder
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


module signExtendAdder(A, B, sum);
	input [31:0] A;
	input [31:0] B;

	output [31:0] sum;
	wire [31:0] carry;
	
	oneBitAdder b0(A[0], B[0], 1'b0, carry[0], sum[0]);   
    oneBitAdder b1(A[1], B[1], carry[0], carry[1], sum[1]);   
    oneBitAdder b2(A[2], B[2], carry[1], carry[2], sum[2]);   
    oneBitAdder b3(A[3], B[3], carry[2], carry[3], sum[3]);   
    oneBitAdder b4(A[4], B[4], carry[3], carry[4], sum[4]);  
    oneBitAdder b5(A[5], B[5], carry[4], carry[5], sum[5]);   
    oneBitAdder b6(A[6], B[6], carry[5], carry[6], sum[6]);  
    oneBitAdder b7(A[7], B[7], carry[6], carry[7], sum[7]);   
	oneBitAdder b8(A[8], B[8], carry[7], carry[8], sum[8]);   
    oneBitAdder b9(A[9], B[9], carry[8], carry[9], sum[9]);   
    oneBitAdder b10(A[10], B[10], carry[9], carry[10], sum[10]);   
    oneBitAdder b11(A[11], B[11], carry[10], carry[11], sum[11]);  
    oneBitAdder b12(A[12], B[12], carry[11], carry[12], sum[12]);   
    oneBitAdder b13(A[13], B[13], carry[12], carry[13], sum[13]);   
    oneBitAdder b14(A[14], B[14], carry[13], carry[14], sum[14]);   
    oneBitAdder b15(A[14], B[14], carry[14], carry[15], sum[15]);   
	oneBitAdder b16(A[15], B[15], carry[15], carry[16], sum[16]);   
    oneBitAdder b17(A[16], B[16], carry[16], carry[17], sum[17]);   
    oneBitAdder b18(A[17], B[17], carry[17], carry[18], sum[18]);   
    oneBitAdder b19(A[18], B[18], carry[18], carry[19], sum[19]);   
    oneBitAdder b20(A[19], B[19], carry[19], carry[20], sum[20]);   
    oneBitAdder b21(A[20], B[20], carry[20], carry[21], sum[21]);   
    oneBitAdder b22(A[21], B[21], carry[21], carry[22], sum[22]);   
    oneBitAdder b23(A[22], B[22], carry[22], carry[23], sum[23]);  
	oneBitAdder b24(A[23], B[23], carry[23], carry[24], sum[24]);  
    oneBitAdder b25(A[24], B[24], carry[24], carry[25], sum[25]);   
    oneBitAdder b26(A[25], B[25], carry[25], carry[26], sum[26]);  
    oneBitAdder b27(A[26], B[26], carry[26], carry[27], sum[27]);   
    oneBitAdder b28(A[27], B[27], carry[27], carry[28], sum[28]);   
    oneBitAdder b29(A[28], B[28], carry[28], carry[29], sum[29]);   
    oneBitAdder b30(A[29], B[29], carry[29], carry[30], sum[30]);  
    oneBitAdder b31(A[30], B[30], carry[30], carry[31], sum[31]);
     
endmodule
