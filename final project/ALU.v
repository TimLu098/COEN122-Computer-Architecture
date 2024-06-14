`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2022 03:08:10 PM
// Design Name: 
// Module Name: ALU
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

module twoToOne(B,sel,out);
//input ports
input [31:0] B;
input sel;
//define input ports as wires
wire [31:0] B;
wire sel;
//define output as 32-bit wire
output [31:0] out;
//define internal wires
wire nSel;
//not gate for select
not(nSel, sel);

and(out[0], B[0], nSel);    //bit 0
and(out[1], B[1], nSel);    //bit 1
and(out[2], B[2], nSel);    //bit 2
and(out[3], B[3], nSel);    //bit 3
and(out[4], B[4], nSel);    //bit 4
and(out[5], B[5], nSel);    //bit 5
and(out[6], B[6], nSel);    //bit 6
and(out[7], B[7], nSel);    //bit 7
and(out[8], B[8], nSel);    //bit 8
and(out[9], B[9], nSel);    //bit 9
and(out[10], B[10], nSel);    //bit 10
and(out[11], B[11], nSel);    //bit 11
and(out[12], B[12], nSel);    //bit 12
and(out[13], B[13], nSel);    //bit 13
and(out[14], B[14], nSel);    //bit 14
and(out[15], B[15], nSel);    //bit 15
and(out[16], B[16], nSel);    //bit 16
and(out[17], B[17], nSel);    //bit 17
and(out[18], B[18], nSel);    //bit 18
and(out[19], B[19], nSel);    //bit 19
and(out[20], B[20], nSel);    //bit 20
and(out[21], B[21], nSel);    //bit 21
and(out[22], B[22], nSel);    //bit 22
and(out[23], B[23], nSel);    //bit 23
and(out[24], B[24], nSel);    //bit 24
and(out[25], B[25], nSel);    //bit 25
and(out[26], B[26], nSel);    //bit 26
and(out[27], B[27], nSel);    //bit 27
and(out[28], B[28], nSel);    //bit 28
and(out[29], B[29], nSel);    //bit 29
and(out[30], B[30], nSel);    //bit 30
and(out[31], B[31], nSel);    //bit 31

endmodule

module oneBitAdder(A,B,cin,cout,out);
//define input ports
input A;
input B;
input cin;
//define output ports
output cout;
output out;
//define input ports as wires
wire A, B, cin;
//define internal wires xAB from xor of A and B, aAB from and of A and B
//aCXAB from and of cin and xAB
wire xAB, aAB, aCXAB;

xor(xAB,A,B);
xor(out,xAB,cin);
and(aCXAB, xAB, cin);
and(aAB, A, B);
or(cout, aCXAB, aAB);

endmodule

module fullAdder(A,B,cout,sum);
//define input ports
input [31:0] A;
input [31:0] B;
//define output ports
output cout;
output [31:0] sum;
//define internal wires
//only need 31 carry wires as last carryout is
wire [30:0] carry;

//oneBitAdder(input1,input2,cin,cout,out)
oneBitAdder b0(A[0], B[0], 1'b0, carry[0], sum[0]);   //bit 0
oneBitAdder b1(A[1], B[1], carry[0], carry[1], sum[1]);   //bit 1
oneBitAdder b2(A[2], B[2], carry[1], carry[2], sum[2]);   //bit 2
oneBitAdder b3(A[3], B[3], carry[2], carry[3], sum[3]);   //bit 3
oneBitAdder b4(A[4], B[4], carry[3], carry[4], sum[4]);   //bit 4
oneBitAdder b5(A[5], B[5], carry[4], carry[5], sum[5]);   //bit 5
oneBitAdder b6(A[6], B[6], carry[5], carry[6], sum[6]);   //bit 6
oneBitAdder b7(A[7], B[7], carry[6], carry[7], sum[7]);   //bit 7
oneBitAdder b8(A[8], B[8], carry[7], carry[8], sum[8]);   //bit 8
oneBitAdder b9(A[9], B[9], carry[8], carry[9], sum[9]);   //bit 9
oneBitAdder b10(A[10], B[10], carry[9], carry[10], sum[10]);   //bit 10
oneBitAdder b11(A[11], B[11], carry[10], carry[11], sum[11]);   //bit 11
oneBitAdder b12(A[12], B[12], carry[11], carry[12], sum[12]);   //bit 12
oneBitAdder b13(A[13], B[13], carry[12], carry[13], sum[13]);   //bit 13
oneBitAdder b14(A[14], B[14], carry[13], carry[14], sum[14]);   //bit 14
oneBitAdder b15(A[15], B[15], carry[14], carry[15], sum[15]);   //bit 15
oneBitAdder b16(A[16], B[16], carry[15], carry[16], sum[16]);   //bit 16
oneBitAdder b17(A[17], B[17], carry[16], carry[17], sum[17]);   //bit 17
oneBitAdder b18(A[18], B[18], carry[17], carry[18], sum[18]);   //bit 18
oneBitAdder b19(A[19], B[19], carry[18], carry[19], sum[19]);   //bit 19
oneBitAdder b20(A[20], B[20], carry[19], carry[20], sum[20]);   //bit 20
oneBitAdder b21(A[21], B[21], carry[20], carry[21], sum[21]);   //bit 21
oneBitAdder b22(A[22], B[22], carry[21], carry[22], sum[22]);   //bit 22
oneBitAdder b23(A[23], B[23], carry[22], carry[23], sum[23]);   //bit 23
oneBitAdder b24(A[24], B[24], carry[23], carry[24], sum[24]);   //bit 24
oneBitAdder b25(A[25], B[25], carry[24], carry[25], sum[25]);   //bit 25
oneBitAdder b26(A[26], B[26], carry[25], carry[26], sum[26]);   //bit 26
oneBitAdder b27(A[27], B[27], carry[26], carry[27], sum[27]);   //bit 27
oneBitAdder b28(A[28], B[28], carry[27], carry[28], sum[28]);   //bit 28
oneBitAdder b29(A[29], B[29], carry[28], carry[29], sum[29]);   //bit 29
oneBitAdder b30(A[30], B[30], carry[29], carry[30], sum[30]);   //bit 30
//instead of carryout of last adder going into carry[31], go to cout
oneBitAdder b31(A[31], B[31], carry[30], cout, sum[31]);   //bit 31

endmodule

module negate(A,out);
//define input ports
input [31:0] A;
//define output ports
output [31:0] out;
//define internal wire
wire [31:0] flip;    //store flipped bits before add 1
wire [31:0] carry;  //carry is for add 1

//use not gate to flip bits
not(flip[0], A[0]);   //bit 0
not(flip[1], A[1]);   //bit 1
not(flip[2], A[2]);   //bit 2
not(flip[3], A[3]);   //bit 3
not(flip[4], A[4]);   //bit 4
not(flip[5], A[5]);   //bit 5
not(flip[6], A[6]);   //bit 6
not(flip[7], A[7]);   //bit 7
not(flip[8], A[8]);   //bit 8
not(flip[9], A[9]);   //bit 9
not(flip[10], A[10]);   //bit 10
not(flip[11], A[11]);   //bit 11
not(flip[12], A[12]);   //bit 12
not(flip[13], A[13]);   //bit 13
not(flip[14], A[14]);   //bit 14
not(flip[15], A[15]);   //bit 15
not(flip[16], A[16]);   //bit 16
not(flip[17], A[17]);   //bit 17
not(flip[18], A[18]);   //bit 18
not(flip[19], A[19]);   //bit 19
not(flip[20], A[20]);   //bit 20
not(flip[21], A[21]);   //bit 21
not(flip[22], A[22]);   //bit 22
not(flip[23], A[23]);   //bit 23
not(flip[24], A[24]);   //bit 24
not(flip[25], A[25]);   //bit 25
not(flip[26], A[26]);   //bit 26
not(flip[27], A[27]);   //bit 27
not(flip[28], A[28]);   //bit 28
not(flip[29], A[29]);   //bit 29
not(flip[30], A[30]);   //bit 30
not(flip[31], A[31]);   //bit 31

//add 1 (copy full adder with some adjustments)
//oneBitAdder(input1,input2,cin,cout,out)
//first add has input2 = 1, the rest are 0
oneBitAdder b0(flip[0], 1'b1, 1'b0, carry[0], out[0]);   //bit 0
oneBitAdder b1(flip[1], 1'b0, carry[0], carry[1], out[1]);   //bit 1
oneBitAdder b2(flip[2], 1'b0, carry[1], carry[2], out[2]);   //bit 2
oneBitAdder b3(flip[3], 1'b0, carry[2], carry[3], out[3]);   //bit 3
oneBitAdder b4(flip[4], 1'b0, carry[3], carry[4], out[4]);   //bit 4
oneBitAdder b5(flip[5], 1'b0, carry[4], carry[5], out[5]);   //bit 5
oneBitAdder b6(flip[6], 1'b0, carry[5], carry[6], out[6]);   //bit 6
oneBitAdder b7(flip[7], 1'b0, carry[6], carry[7], out[7]);   //bit 7
oneBitAdder b8(flip[8], 1'b0, carry[7], carry[8], out[8]);   //bit 8
oneBitAdder b9(flip[9], 1'b0, carry[8], carry[9], out[9]);   //bit 9
oneBitAdder b10(flip[10], 1'b0, carry[9], carry[10], out[10]);   //bit 10
oneBitAdder b11(flip[11], 1'b0, carry[10], carry[11], out[11]);   //bit 11
oneBitAdder b12(flip[12], 1'b0, carry[11], carry[12], out[12]);   //bit 12
oneBitAdder b13(flip[13], 1'b0, carry[12], carry[13], out[13]);   //bit 13
oneBitAdder b14(flip[14], 1'b0, carry[13], carry[14], out[14]);   //bit 14
oneBitAdder b15(flip[15], 1'b0, carry[14], carry[15], out[15]);   //bit 15
oneBitAdder b16(flip[16], 1'b0, carry[15], carry[16], out[16]);   //bit 16
oneBitAdder b17(flip[17], 1'b0, carry[16], carry[17], out[17]);   //bit 17
oneBitAdder b18(flip[18], 1'b0, carry[17], carry[18], out[18]);   //bit 18
oneBitAdder b19(flip[19], 1'b0, carry[18], carry[19], out[19]);   //bit 19
oneBitAdder b20(flip[20], 1'b0, carry[19], carry[20], out[20]);   //bit 20
oneBitAdder b21(flip[21], 1'b0, carry[20], carry[21], out[21]);   //bit 21
oneBitAdder b22(flip[22], 1'b0, carry[21], carry[22], out[22]);   //bit 22
oneBitAdder b23(flip[23], 1'b0, carry[22], carry[23], out[23]);   //bit 23
oneBitAdder b24(flip[24], 1'b0, carry[23], carry[24], out[24]);   //bit 24
oneBitAdder b25(flip[25], 1'b0, carry[24], carry[25], out[25]);   //bit 25
oneBitAdder b26(flip[26], 1'b0, carry[25], carry[26], out[26]);   //bit 26
oneBitAdder b27(flip[27], 1'b0, carry[26], carry[27], out[27]);   //bit 27
oneBitAdder b28(flip[28], 1'b0, carry[27], carry[28], out[28]);   //bit 28
oneBitAdder b29(flip[29], 1'b0, carry[28], carry[29], out[29]);   //bit 29
oneBitAdder b30(flip[30], 1'b0, carry[29], carry[30], out[30]);   //bit 30
oneBitAdder b31(flip[31], 1'b0, carry[30], carry[31], out[31]);   //bit 31

endmodule

module threeToOne(A,negA,sel,out);
//define input ports
input [31:0] A;
input [31:0] negA;
input [1:0] sel;
//define output ports
output [31:0] out;
//define internal wire
wire nS0, nS1;
wire [31:0] wA;     //and gate for A
wire [31:0] wNA;    //and gate for NegA
wire w1;            //and gate for 1

//get not of select[0] and select[1]
not(nS0, sel[0]);
not(nS1, sel[1]);

//wire coming out of and gate for A
and(wA[0], A[0], nS0, nS1); //bit 0
and(wA[1], A[1], nS0, nS1); //bit 1
and(wA[2], A[2], nS0, nS1); //bit 2
and(wA[3], A[3], nS0, nS1); //bit 3
and(wA[4], A[4], nS0, nS1); //bit 4
and(wA[5], A[5], nS0, nS1); //bit 5
and(wA[6], A[6], nS0, nS1); //bit 6
and(wA[7], A[7], nS0, nS1); //bit 7
and(wA[8], A[8], nS0, nS1); //bit 8
and(wA[9], A[9], nS0, nS1); //bit 9
and(wA[10], A[10], nS0, nS1); //bit 10
and(wA[11], A[11], nS0, nS1); //bit 11
and(wA[12], A[12], nS0, nS1); //bit 12
and(wA[13], A[13], nS0, nS1); //bit 13
and(wA[14], A[14], nS0, nS1); //bit 14
and(wA[15], A[15], nS0, nS1); //bit 15
and(wA[16], A[16], nS0, nS1); //bit 16
and(wA[17], A[17], nS0, nS1); //bit 17
and(wA[18], A[18], nS0, nS1); //bit 18
and(wA[19], A[19], nS0, nS1); //bit 19
and(wA[20], A[20], nS0, nS1); //bit 20
and(wA[21], A[21], nS0, nS1); //bit 21
and(wA[22], A[22], nS0, nS1); //bit 22
and(wA[23], A[23], nS0, nS1); //bit 23
and(wA[24], A[24], nS0, nS1); //bit 24
and(wA[25], A[25], nS0, nS1); //bit 25
and(wA[26], A[26], nS0, nS1); //bit 26
and(wA[27], A[27], nS0, nS1); //bit 27
and(wA[28], A[28], nS0, nS1); //bit 28
and(wA[29], A[29], nS0, nS1); //bit 29
and(wA[30], A[30], nS0, nS1); //bit 30
and(wA[31], A[31], nS0, nS1); //bit 31

//wire out of and gate for negA
and(wNA[0], negA[0], sel[1], nS0);  //bit 0
and(wNA[1], negA[1], sel[1], nS0);  //bit 1
and(wNA[2], negA[2], sel[1], nS0);  //bit 2
and(wNA[3], negA[3], sel[1], nS0);  //bit 3
and(wNA[4], negA[4], sel[1], nS0);  //bit 4
and(wNA[5], negA[5], sel[1], nS0);  //bit 5
and(wNA[6], negA[6], sel[1], nS0);  //bit 6
and(wNA[7], negA[7], sel[1], nS0);  //bit 7
and(wNA[8], negA[8], sel[1], nS0);  //bit 8
and(wNA[9], negA[9], sel[1], nS0);  //bit 9
and(wNA[10], negA[10], sel[1], nS0);  //bit 10
and(wNA[11], negA[11], sel[1], nS0);  //bit 11
and(wNA[12], negA[12], sel[1], nS0);  //bit 12
and(wNA[13], negA[13], sel[1], nS0);  //bit 13
and(wNA[14], negA[14], sel[1], nS0);  //bit 14
and(wNA[15], negA[15], sel[1], nS0);  //bit 15
and(wNA[16], negA[16], sel[1], nS0);  //bit 16
and(wNA[17], negA[17], sel[1], nS0);  //bit 17
and(wNA[18], negA[18], sel[1], nS0);  //bit 18
and(wNA[19], negA[19], sel[1], nS0);  //bit 19
and(wNA[20], negA[20], sel[1], nS0);  //bit 20
and(wNA[21], negA[21], sel[1], nS0);  //bit 21
and(wNA[22], negA[22], sel[1], nS0);  //bit 22
and(wNA[23], negA[23], sel[1], nS0);  //bit 23
and(wNA[24], negA[24], sel[1], nS0);  //bit 24
and(wNA[25], negA[25], sel[1], nS0);  //bit 25
and(wNA[26], negA[26], sel[1], nS0);  //bit 26
and(wNA[27], negA[27], sel[1], nS0);  //bit 27
and(wNA[28], negA[28], sel[1], nS0);  //bit 28
and(wNA[29], negA[29], sel[1], nS0);  //bit 29
and(wNA[30], negA[30], sel[1], nS0);  //bit 30
and(wNA[31], negA[31], sel[1], nS0);  //bit 31

//output of and gate for 1
//need to make bits 1-31 = 0 and bit 0 = 1
//use and gate to make bit 0 = 1
//don't need to do anything for bits 1-31
and(w1, nS1, sel[0]);  //bit 0


//final output
//only use w1 for bit 0, so if the mux needs to output 1
//it will output 0000...00001
or(out[0], wA[0], wNA[0], w1);   //bit 0
or(out[1], wA[1], wNA[1]);   //bit 1
or(out[2], wA[2], wNA[2]);   //bit 2
or(out[3], wA[3], wNA[3]);   //bit 3
or(out[4], wA[4], wNA[4]);   //bit 4
or(out[5], wA[5], wNA[5]);   //bit 5
or(out[6], wA[6], wNA[6]);   //bit 6
or(out[7], wA[7], wNA[7]);   //bit 7
or(out[8], wA[8], wNA[8]);   //bit 8
or(out[9], wA[9], wNA[9]);   //bit 9
or(out[10], wA[10], wNA[10]);   //bit 10
or(out[11], wA[11], wNA[11]);   //bit 11
or(out[12], wA[12], wNA[12]);   //bit 12
or(out[13], wA[13], wNA[13]);   //bit 13
or(out[14], wA[14], wNA[14]);   //bit 14
or(out[15], wA[15], wNA[15]);   //bit 15
or(out[16], wA[16], wNA[16]);   //bit 16
or(out[17], wA[17], wNA[17]);   //bit 17
or(out[18], wA[18], wNA[18]);   //bit 18
or(out[19], wA[19], wNA[19]);   //bit 19
or(out[20], wA[20], wNA[20]);   //bit 20
or(out[21], wA[21], wNA[21]);   //bit 21
or(out[22], wA[22], wNA[22]);   //bit 22
or(out[23], wA[23], wNA[23]);   //bit 23
or(out[24], wA[24], wNA[24]);   //bit 24
or(out[25], wA[25], wNA[25]);   //bit 25
or(out[26], wA[26], wNA[26]);   //bit 26
or(out[27], wA[27], wNA[27]);   //bit 27
or(out[28], wA[28], wNA[28]);   //bit 28
or(out[29], wA[29], wNA[29]);   //bit 29
or(out[30], wA[30], wNA[30]);   //bit 30
or(out[31], wA[31], wNA[31]);   //bit 31

endmodule


module ALU(B, A,add,inc,neg,sub,out,Z,N);
//define input ports
input [31:0] A;
input [31:0] B;
input add, inc, neg, sub;
//define output ports
output Z, N;
output [31:0] out;
//define internal wires
wire [31:0] negA;
wire [31:0] threeToOneW;
wire [31:0] twoToOneW;
wire [1:0] select;
wire not_sub;
wire cout;

//Generating Selects for Each mux
//3 to 1 mux
not(not_sub, sub);
and(select[0], inc, not_sub);
nor(select[1], add, inc);
//2 to 1 mux 
//feed neg into select in function call

//2's complement generator
//negate(A,out)
negate nA(A, negA);

//3 to 1 mux
//threeToOne(A,negA,sel,out)
threeToOne m3(A, negA, select, threeToOneW);

//2 to 1 mux
//twoToOne(B,sel,out)
twoToOne m2(B, neg, twoToOneW);

//full adder
//fullAdder(A,B,cout,sum)
fullAdder fA(threeToOneW, twoToOneW, cout, out);

//N flag
// N = 1 if negative
//out[31] is the sign bit in 2's complement and the adder
//would output a number in 2's complement if it's negative
//if the sign bit is 1, its negative
and(N, out[31], 1'b1);

//Z flag
//Z = 1 if zero and Z = 0 if there is a 1 in [31:0] out
//to check all bits in out I could put all of them in an 
//or gate and have the Z flag be the gate's output but
//that would result in Z = 1 if there is a 1 in the output
//so use a nor gate instead
nor(Z, out[31], out[30], out[29], out[28], out[27], out[26], out[25], 
out[24], out[23], out[22], out[21], out[20], out[19], out[18], out[17], 
out[16], out[15], out[14], out[13], out[12], out[11], out[10], out[9], 
out[8], out[7], out[6], out[5], out[4], out[3], out[2], out[1], out[0]);


endmodule
