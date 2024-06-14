module twoToOne(B,neg,outB);

input [31:0]B;
input neg; //sel=neg

wire SN;
wire [31:0]w1;
wire [31:0]w2;
wire [31:0]SUM1;
wire [31:0]SUM2;
wire [31:0]SUM3;
wire [31:0]SUM4;

output [31:0]outB;

not(SN,neg);


and(w1[0],B[0],SN);
and(w1[1],B[1],SN);
and(w1[2],B[2],SN);
and(w1[3],B[3],SN);
and(w1[4],B[4],SN);
and(w1[5],B[5],SN);
and(w1[6],B[6],SN);
and(w1[7],B[7],SN);
and(w1[8],B[8],SN);
and(w1[9],B[9],SN);
and(w1[10],B[10],SN);
and(w1[11],B[11],SN);
and(w1[12],B[12],SN);
and(w1[13],B[13],SN);
and(w1[14],B[14],SN);
and(w1[15],B[15],SN);
and(w1[16],B[16],SN);
and(w1[17],B[17],SN);
and(w1[18],B[18],SN);
and(w1[19],B[19],SN);
and(w1[20],B[20],SN);
and(w1[21],B[21],SN);
and(w1[22],B[22],SN);
and(w1[23],B[23],SN);
and(w1[24],B[24],SN);
and(w1[25],B[25],SN);
and(w1[26],B[26],SN);
and(w1[27],B[27],SN);
and(w1[28],B[28],SN);
and(w1[29],B[29],SN);
and(w1[30],B[30],SN);
and(w1[31],B[31],SN);

fullAdder add4(w1,1,cout,SUM1);

and(w2[0],neg,0);
and(w2[1],neg,0);
and(w2[2],neg,0);
and(w2[3],neg,0);
and(w2[4],neg,0);
and(w2[5],neg,0);
and(w2[6],neg,0);
and(w2[7],neg,0);
and(w2[8],neg,0);
and(w2[9],neg,0);
and(w2[10],neg,0);
and(w2[11],neg,0);
and(w2[12],neg,0);
and(w2[13],neg,0);
and(w2[14],neg,0);
and(w2[15],neg,0);
and(w2[16],neg,0);
and(w2[17],neg,0);
and(w2[18],neg,0);
and(w2[19],neg,0);
and(w2[20],neg,0);
and(w2[21],neg,0);
and(w2[22],neg,0);
and(w2[23],neg,0);
and(w2[24],neg,0);
and(w2[25],neg,0);
and(w2[26],neg,0);
and(w2[27],neg,0);
and(w2[28],neg,0);
and(w2[29],neg,0);
and(w2[30],neg,0);
and(w2[31],neg,0);

fullAdder add5(w2,1,cout,SUM2);


or(outB[0],w1[0],w2[0]);
or(outB[1],w1[1],w2[1]);
or(outB[2],w1[2],w2[2]);
or(outB[3],w1[3],w2[3]);
or(outB[4],w1[4],w2[4]);
or(outB[5],w1[5],w2[5]);
or(outB[6],w1[6],w2[6]);
or(outB[7],w1[7],w2[7]);
or(outB[8],w1[8],w2[8]);
or(outB[9],w1[9],w2[9]);
or(outB[10],w1[10],w2[10]);
or(outB[11],w1[11],w2[11]);
or(outB[12],w1[12],w2[12]);
or(outB[13],w1[13],w2[13]);
or(outB[14],w1[14],w2[14]);
or(outB[15],w1[15],w2[15]);
or(outB[16],w1[16],w2[16]);
or(outB[17],w1[17],w2[17]);
or(outB[18],w1[18],w2[18]);
or(outB[19],w1[19],w2[19]);
or(outB[20],w1[20],w2[20]);
or(outB[21],w1[21],w2[21]);
or(outB[22],w1[22],w2[22]);
or(outB[23],w1[23],w2[23]);
or(outB[24],w1[24],w2[24]);
or(outB[24],w1[24],w2[24]);
or(outB[25],w1[25],w2[25]);
or(outB[26],w1[26],w2[26]);
or(outB[27],w1[27],w2[27]);
or(outB[28],w1[28],w2[28]);
or(outB[29],w1[29],w2[29]);
or(outB[30],w1[30],w2[30]);
or(outB[31],w1[31],w2[31]);

fullAdder add6(outB,1,cout,SUM4);




endmodule