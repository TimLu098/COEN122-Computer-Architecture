module fullAdder(A,B,cout,sum);
    input[31:0]A,B;
    output[31:0]sum;
    
    
    output cout;

   wire [31:0]w;

oneBitAdder x1(A[0], B[0], 1, sum[0], w[1]);
oneBitAdder x2(A[1], B[1], w[1], sum[1], w[2]);
oneBitAdder x3(A[2], B[2], w[2], sum[2], w[3]);
oneBitAdder x4(A[3], B[3], w[3], sum[3], w[4]);
oneBitAdder x5(A[4], B[4], w[4], sum[4], w[5]);
oneBitAdder x6(A[5], B[5], w[5], sum[5], w[6]);
oneBitAdder x7(A[6], B[6], w[6], sum[6], w[7]);
oneBitAdder x8(A[7], B[7], w[7], sum[7], w[8]);
oneBitAdder x9(A[8], B[8], w[8], sum[8], w[9]);
oneBitAdder x10(A[9], B[9], w[9], sum[9], w[10]);
oneBitAdder x11(A[10], B[10], w[10], sum[10], w[11]);
oneBitAdder x12(A[11], B[11], w[11], sum[11], w[12]);
oneBitAdder x13(A[12], B[12], w[12], sum[12], w[13]);
oneBitAdder x14(A[13], B[13], w[13], sum[13], w[14]);
oneBitAdder x15(A[14], B[14], w[14], sum[14], w[15]);
oneBitAdder x16(A[15], B[15], w[15], sum[15], w[16]);
oneBitAdder x17(A[16], B[16], w[16], sum[16], w[17]);
oneBitAdder x18(A[17], B[17], w[17], sum[17], w[18]);
oneBitAdder x19(A[18], B[18], w[18], sum[18], w[19]);
oneBitAdder x20(A[19], B[19], w[19], sum[19], w[20]);
oneBitAdder x21(A[20], B[21], w[20], sum[20], w[21]);
oneBitAdder x22(A[21], B[21], w[21], sum[21], w[22]);
oneBitAdder x23(A[22], B[22], w[22], sum[22], w[23]);
oneBitAdder x24(A[23], B[23], w[23], sum[23], w[24]);
oneBitAdder x25(A[24], B[24], w[24], sum[24], w[25]);
oneBitAdder x26(A[25], B[25], w[25], sum[25], w[26]);
oneBitAdder x27(A[26], B[26], w[26], sum[26], w[27]);
oneBitAdder x28(A[27], B[27], w[27], sum[27], w[28]);
oneBitAdder x29(A[28], B[28], w[28], sum[28], w[29]);
oneBitAdder x30(A[29], B[29], w[29], sum[29], w[30]);
oneBitAdder x31(A[30], B[30], w[30], sum[30], w[31]);
oneBitAdder x32(A[31], B[31], w[31], sum[31], cout);

endmodule
