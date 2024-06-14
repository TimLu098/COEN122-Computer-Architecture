module EX_WB(clk, N,Z, JumpMem, Jump, BranchZero,BranchNeg, PCtoReg, MemToReg, RegWrite, ALU, DataMem, rd, adder, N_out, Z_out, JumpMem_out, Jump_out, BranchZero_out, BranchNeg_out, PCtoReg_out, MemToReg_out, RegWrite_out, ALU_out, DataMem_out, rd_out, adder_out);
input clk;
input N;
input Z; 
input JumpMem; 
input Jump; 
input BranchZero;
input BranchNeg; 
input PCtoReg; 
input MemToReg; 
input RegWrite; 
input [31:0]ALU; 
input [31:0] DataMem; 
input [5:0]rd; 
input [31:0]adder;



//output 

output reg  N_out;
output reg Z_out; 
output reg JumpMem_out; 
output reg Jump_out; 
output reg BranchZero_out;
output reg BranchNeg_out; 
output reg PCtoReg_out; 
output reg MemToReg_out; 
output reg RegWrite_out; 
output reg [31:0]ALU_out; 
output reg [31:0] DataMem_out; 
output reg [5:0] rd_out; 
output reg [31:0] adder_out;



always@(posedge clk)
begin
    N_out = N;
    Z_out = Z; 
    JumpMem_out = JumpMem; 
    Jump_out = Jump; 
    BranchZero_out = BranchZero;
    BranchNeg_out = BranchNeg; 
    PCtoReg_out = PCtoReg;
    MemToReg_out = MemToReg;
    RegWrite_out = RegWrite;
    ALU_out = ALU; 
    DataMem_out = DataMem; 
    rd_out = rd; 
    adder_out = adder;
end


endmodule