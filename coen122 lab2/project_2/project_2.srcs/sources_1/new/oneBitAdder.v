module oneBitAdder(A,B,cin,cout,out);
input A,B,cin;
output cout,out;
wire w1,w2,w3;

assign w1= A ^ B;

and(w2,w1,cin);
and(w3,A,B);

assign out= w1 ^ cin;
assign cout= w2 | w3;

endmodule