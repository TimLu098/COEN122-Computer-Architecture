module threeToOne(A,negA,sel,outA);
input [31:0]A;
input [31:0]negA;
input [1:0]sel;

wire SN0,SN1;
wire [31:0]w;
wire [31:0]w1;
wire [31:0]w2;
wire [31:0]sum1;
wire [31:0]sum2;
wire [31:0]sum3;
wire [31:0]sum4;
wire [31:0]sum5;



output [31:0]outA;

negate three_neg(A,out);

not(SN1,sel[1]);
not(SN0,sel[0]);

and(w[0],A[0],SN1,SN0);
and(w[1],A[1],SN1,SN0);
and(w[2],A[2],SN1,SN0);
and(w[3],A[3],SN1,SN0);
and(w[4],A[4],SN1,SN0);
and(w[5],A[5],SN1,SN0);
and(w[6],A[6],SN1,SN0);
and(w[7],A[7],SN1,SN0);
and(w[8],A[8],SN1,SN0);
and(w[9],A[9],SN1,SN0);
and(w[10],A[10],SN1,SN0);
and(w[11],A[11],SN1,SN0);
and(w[12],A[12],SN1,SN0);
and(w[13],A[13],SN1,SN0);
and(w[14],A[14],SN1,SN0);
and(w[15],A[15],SN1,SN0);
and(w[16],A[16],SN1,SN0);
and(w[17],A[17],SN1,SN0);
and(w[18],A[18],SN1,SN0);
and(w[19],A[19],SN1,SN0);
and(w[20],A[20],SN1,SN0);
and(w[21],A[21],SN1,SN0);
and(w[22],A[22],SN1,SN0);
and(w[23],A[23],SN1,SN0);
and(w[24],A[24],SN1,SN0);
and(w[25],A[25],SN1,SN0);
and(w[26],A[26],SN1,SN0);
and(w[27],A[27],SN1,SN0);
and(w[28],A[28],SN1,SN0);
and(w[29],A[29],SN1,SN0);
and(w[30],A[30],SN1,SN0);
and(w[31],A[31],SN1,SN0);

fullAdder add1(w,1,cout,sum1);



and(w1[0],1,SN1,sel[0]);
and(w1[1],1,SN1,sel[0]);
and(w1[2],1,SN1,sel[0]);
and(w1[3],1,SN1,sel[0]);
and(w1[4],1,SN1,sel[0]);
and(w1[5],1,SN1,sel[0]);
and(w1[6],1,SN1,sel[0]);
and(w1[7],1,SN1,sel[0]);
and(w1[8],1,SN1,sel[0]);
and(w1[9],1,SN1,sel[0]);
and(w1[10],1,SN1,sel[0]);
and(w1[11],1,SN1,sel[0]);
and(w1[12],1,SN1,sel[0]);
and(w1[13],1,SN1,sel[0]);
and(w1[14],1,SN1,sel[0]);
and(w1[15],1,SN1,sel[0]);
and(w1[16],1,SN1,sel[0]);
and(w1[17],1,SN1,sel[0]);
and(w1[18],1,SN1,sel[0]);
and(w1[19],1,SN1,sel[0]);
and(w1[20],1,SN1,sel[0]);
and(w1[21],1,SN1,sel[0]);
and(w1[22],1,SN1,sel[0]);
and(w1[23],1,SN1,sel[0]);
and(w1[24],1,SN1,sel[0]);
and(w1[25],1,SN1,sel[0]);
and(w1[26],1,SN1,sel[0]);
and(w1[27],1,SN1,sel[0]);
and(w1[28],1,SN1,sel[0]);
and(w1[29],1,SN1,sel[0]);
and(w1[30],1,SN1,sel[0]);
and(w1[31],1,SN1,sel[0]);

fullAdder add2(w1,1,cout,sum2);



and(w2[0],negA[0],sel[1],sel[0]);
and(w2[1],negA[1],sel[1],sel[0]);
and(w2[2],negA[2],sel[1],sel[0]);
and(w2[3],negA[3],sel[1],sel[0]);
and(w2[4],negA[4],sel[1],sel[0]);
and(w2[5],negA[5],sel[1],sel[0]);
and(w2[6],negA[6],sel[1],sel[0]);
and(w2[7],negA[7],sel[1],sel[0]);
and(w2[8],negA[8],sel[1],sel[0]);
and(w2[9],negA[9],sel[1],sel[0]);
and(w2[10],negA[10],sel[1],sel[0]);
and(w2[11],negA[11],sel[1],sel[0]);
and(w2[12],negA[12],sel[1],sel[0]);
and(w2[13],negA[13],sel[1],sel[0]);
and(w2[14],negA[14],sel[1],sel[0]);
and(w2[15],negA[15],sel[1],sel[0]);
and(w2[16],negA[16],sel[1],sel[0]);
and(w2[17],negA[17],sel[1],sel[0]);
and(w2[18],negA[18],sel[1],sel[0]);
and(w2[19],negA[19],sel[1],sel[0]);
and(w2[20],negA[20],sel[1],sel[0]);
and(w2[21],negA[21],sel[1],sel[0]);
and(w2[22],negA[22],sel[1],sel[0]);
and(w2[23],negA[23],sel[1],sel[0]);
and(w2[24],negA[24],sel[1],sel[0]);
and(w2[25],negA[25],sel[1],sel[0]);
and(w2[26],negA[26],sel[1],sel[0]);
and(w2[27],negA[27],sel[1],sel[0]);
and(w2[28],negA[28],sel[1],sel[0]);
and(w2[29],negA[29],sel[1],sel[0]);
and(w2[30],negA[30],sel[1],sel[0]);
and(w2[31],negA[31],sel[1],sel[0]);

fullAdder add3(w2,1,cout,sum3);


or(sum4[0],sum1[0],sum2[0],sum3[0]);
or(sum4[1],sum1[1],sum2[1],sum3[1]);
or(sum4[2],sum1[2],sum2[2],sum3[2]);
or(sum4[3],sum1[3],sum2[3],sum3[3]);
or(sum4[4],sum1[4],sum2[4],sum3[4]);
or(sum4[5],sum1[5],sum2[5],sum3[5]);
or(sum4[6],sum1[6],sum2[6],sum3[6]);
or(sum4[7],sum1[7],sum2[7],sum3[7]);
or(sum4[8],sum1[8],sum2[8],sum3[8]);
or(sum4[9],sum1[9],sum2[9],sum3[9]);
or(sum4[10],sum1[10],sum2[10],sum3[10]);
or(sum4[11],sum1[11],sum2[11],sum3[11]);
or(sum4[12],sum1[12],sum2[12],sum3[12]);
or(sum4[13],sum1[13],sum2[13],sum3[13]);
or(sum4[14],sum1[14],sum2[14],sum3[14]);
or(sum4[15],sum1[15],sum2[15],sum3[15]);
or(sum4[16],sum1[16],sum2[16],sum3[16]);
or(sum4[17],sum1[17],sum2[17],sum3[17]);
or(sum4[18],sum1[18],sum2[18],sum3[18]);
or(sum4[19],sum1[19],sum2[19],sum3[19]);
or(sum4[20],sum1[20],sum2[20],sum3[20]);
or(sum4[21],sum1[21],sum2[21],sum3[21]);
or(sum4[22],sum1[22],sum2[22],sum3[22]);
or(sum4[23],sum1[23],sum2[23],sum3[23]);
or(sum4[24],sum1[24],sum2[24],sum3[24]);
or(sum4[25],sum1[25],sum2[25],sum3[25]);
or(sum4[26],sum1[26],sum2[26],sum3[26]);
or(sum4[27],sum1[27],sum2[27],sum3[27]);
or(sum4[28],sum1[28],sum2[28],sum3[28]);
or(sum4[29],sum1[29],sum2[29],sum3[29]);
or(sum4[30],sum1[30],sum2[30],sum3[30]);
or(sum4[31],sum1[31],sum2[31],sum3[31]);

fullAdder add4(sum4,1,cout,sum5);


assign outA = sum5;

endmodule