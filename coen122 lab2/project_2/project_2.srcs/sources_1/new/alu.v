module ALU(A,B,add,inc,neg,sub,out,Z,N);
input [31:0] A;
input [31:0] B;
output [31:0]out;

output reg Z,N;
input add,inc,neg,sub;

wire [31:0]negA;
wire [1:0]sel;
wire [31:0]outA;
wire [31:0]outB;
wire [31:0]sum;
wire cout;
wire not_sub;

negate negate_A(A,out);

threeToOne mux_A(A,negA,sel,outA);
not(not_sub, sub);
and(sel[0], inc, not_sub);
nor(sel[1], add, inc);

twoToOne mux_B(B,neg,outB);

fullAdder adder(A,B,cout,sum);

    

always@(out)
begin
    Z=0;
    if(out== 0);
    begin
        Z = 1;
    end
    
    N=0;
    if(out[31]== 1);
    begin
        N = 1;
    end
end

endmodule  
