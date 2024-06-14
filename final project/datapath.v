`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2022 03:25:19 PM
// Design Name: 
// Module Name: datapath
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


module datapath();
    reg clock;
    
    //wires
        //wires in IF stage
    wire [31:0] PCMux_To_PC;
    wire [31:0] PCAdder_To_PCMux;
    wire [31:0] PC_Out;     //to IFID, Adder, and InstMem
    wire [31:0] InstMem_To_IFID;
        //wires in ID Stage
    wire [31:0] IFID_Out;
    //wire [5:0] rs_IFID_To_Reg;
    //wire [5:0] rt_IFID_To_Reg;
    //wire [5:0] rd_IFID_To_IDEX;
    wire [5:0] rd_EXWB_To_Reg;
    wire mux_WB_To_Reg;
    wire RegWrite_EXWB_To_Reg;
    wire [31:0] rs_Reg_To_IDEX;
    wire [31:0] rt_Reg_To_IDEX;
    // Control units
    //wire[3:0] IFID_To_Control;
    wire RegWrite_Control_To_IDEX;
    wire MemToReg_Control_To_IDEX;
    wire PCtoReg_Control_To_IDEX;
    wire BranchNeg_Control_To_IDEX;
    wire BranchZero_Control_To_IDEX;
    wire Jump_Control_To_IDEX;
    wire JumpMem_Control_To_IDEX;
    wire[3:0] ALUOP_Control_To_IDEX;
    wire MemRead_Control_To_IDEX;
    wire MemWrite_Control_To_IDEX;
    wire ALUMux_Control_To_IDEX;
    //wire[31:0] IFID_To_SignExtend;
    wire [31:0] SignExtend_Out;
    //wire[31:0] SignExtend_To_Adder;
    wire[31:0] PC_IFID_To_Adder;
    //wire[31:0] SignExtend_To_IDEX;
    wire[31:0] Adder_To_IDEX;

        //wires in EX Stage
    wire RegWrite_IDEX_To_EXWB;
    wire MemToReg_IDEX_To_EXWB;
    wire PCToReg_IDEX_To_EXWB;
    wire BranchNeg_IDEX_To_EXWB;
    wire BranchZero_IDEX_To_EXWB;
    wire Jump_IDEX_To_EXWB;
    wire JumpMem_IDEX_To_EXWB;
    wire [3:0] ALUop_IDEX_To_ALU;
    wire MemRead_IDEX_To_DataMem;
    wire MemWrite_IDEX_To_DataMem;
    wire [31:0] rs_IDEX_Out;
    //wire rs_IDEX_To_ALU;
    //wire rs_IDEX_To_DataMem;
    wire [31:0] rt_IDEX_Out;
    //wire rt_IDEX_To_ALUMux;
    //wire rt_IDEX_To_DataMem;
    wire ALUMux_IDEX_To_ALUMux;
    wire [31:0] ALUMux_To_ALU;
    wire [31:0] SignExtend_IDEX_To_ALUMux;
    wire NFlag_ALU_To_EXWB;
    wire ZFlag_ALU_To_EXWB;
    wire [31:0] ALU_To_EXWB;
    wire [31:0] DataMem_To_EXWB;
    wire [5:0] rd_IDEX_To_EXWB;
    wire SignExtend_IDEX_To_EXWB;
    wire [31:0] SignExtendAdder_IDEX_To_EXWB;
        //wires in WB Stage
    wire NFlag_EXWB_To_Gate;
    wire ZFlag_EXWB_To_Gate;
    wire MemToReg_EXWB_To_WBMux;
    wire PCtoReg_EXWB_To_WBMux;
    wire BranchNeg_EXWB_To_Gate;
    wire BranchZero_EXWB_To_Gate;
    wire Jump_EXWB_To_Gate;
    wire JumpMem_EXWB_To_PCMux;
    wire [31:0] ALU_EXWB_Out;
    //wire [31:0] ALU_EXWB_To_WBMux;
    //wire [31:0] ALU_EXWB_To_PCMux;
    wire [31:0] DM_EXWB_Out;
    //wire [31:0] DM_EXWB_To_WBMux;
    //wire [31:0] DM_EXWB_To_PCMux;
    wire [31:0] Adder_EXWB_To_WBMux;
    wire Branch_Gate_To_PCMux;
    wire [31:0] WBMux_Out_To_Reg;
    
//IF Stage
    
    //module muxThreeToOne(A, B, C, select1, select0, out);
    muxThreeToOne PCMux(PCAdder_To_PCMux, ALU_EXWB_Out, DM_EXWB_Out, JumpMem_EXWB_To_PCMux, Branch_Gate_To_PCMux, PCMux_To_PC);
    //muxThreeToOne PCMux(101, 102, 103, 0, 1, PCMux_To_PC);
    
    //pcModule(clock, pcIn, pcOut);
    pcModule PC(clock, PCMux_To_PC, PC_Out);  //PCMux_To_PC[7:0] is just taking the last 8-bits of that 32-bit output
    //pcModule PC(clock, 8'b00000001, PC_Out);
    
    //pc doesn't record cout because there is no way have a cout that is not 0 because we dont have that many instructions
    //module pcAdder(A, B, sum);
    pcAdder PCAdder(PC_Out, 8'b00000001, PCAdder_To_PCMux);
    //pcAdder PCAdder(100, 8'b00000001, PCAdder_To_PCMux);
    
    //module instructionMemory(clock, pc, instruction);
    instructionMemory instrucMem(clock, PC_Out, InstMem_To_IFID);
    //instructionMemory instrucMem(clock, 1, InstMem_To_IFID);
    
    //module IF_ID(clk,pc_in,inst_in,pc_out,inst_out);
    IF_ID ifid(clock, PC_Out, InstMem_To_IFID, PC_IFID_To_Adder, IFID_Out);   // the instructionout ?
    //IF_ID ifid(clock, 1, 32'b11110000010000000000000001100100, PC_IFID_To_Adder, IFID_Out);   // the instructionout ?
    
//ID Stage
    
    //assign the wires that split off from output of IF/ID Buffer
    //assign IFID_To_Control = IFID_To_SignExtend[31:28];
    //assign rs_IFID_To_Reg = IFID_To_SignExtend[21:16];
    //assign rt_IFID_To_Reg = IFID_To_SignExtend[15:10];
    //assign rd_IFID_To_IDEX = IFID_To_SignExtend[27:22];
    
    
    //module control(opcode, RegWrite, MemToReg, PCToReg, BranchN, BranchZ, Jump, JumpMem, MemRead, MemWrite, ALUOp, ALUMux);
    control Control(IFID_Out[31:28], RegWrite_Control_To_IDEX, MemToReg_Control_To_IDEX, PCtoReg_Control_To_IDEX, BranchNeg_Control_To_IDEX, BranchZero_Control_To_IDEX, Jump_Control_To_IDEX, JumpMem_Control_To_IDEX, MemRead_Control_To_IDEX, MemWrite_Control_To_IDEX, ALUOP_Control_To_IDEX, ALUMux_Control_To_IDEX);
    //control Control(4'b1111, RegWrite_Control_To_IDEX, MemToReg_Control_To_IDEX, PCtoReg_Control_To_IDEX, BranchNeg_Control_To_IDEX, BranchZero_Control_To_IDEX, Jump_Control_To_IDEX, JumpMem_Control_To_IDEX, MemRead_Control_To_IDEX, MemWrite_Control_To_IDEX, ALUOP_Control_To_IDEX, ALUMux_Control_To_IDEX);
    
    //module registerFile(clock, regWrite, rs, rt, wrtAddress, Data, rsOut, rtOut);
    registerFile regFile(clock, RegWrite_EXWB_To_Reg, IFID_Out[21:16], IFID_Out[15:10], rd_EXWB_To_Reg, WBMux_Out_To_Reg, rs_Reg_To_IDEX, rt_Reg_To_IDEX); // we assume wrtData to be rd_EXWB_To_Reg
    //registerFile regFile(clock, 0, 6'b000100, 6'b000101, 8, 2, rs_Reg_To_IDEX, rt_Reg_To_IDEX); // we assume wrtData to be rd_EXWB_To_Reg

    //module signExtend(instIn, immOut);
    signExtend SignExtend(IFID_Out, SignExtend_Out);
    //signExtend SignExtend(32'b11110000001000000000000000000000, SignExtend_Out);
    //expect 1111111111110000000000000000000000 since bit-21 is a 1 and uses svpc opcode

    // module module signExtendAdder(A, B, sum);
    signExtendAdder adder(SignExtend_Out, PC_IFID_To_Adder, Adder_To_IDEX);
    //signExtendAdder adder(100, 1, Adder_To_IDEX);

    //module ID_EX(clk,MemWrite, MemRead, ALUOP, JumpMem, Jump, BranchZero,BranchNeg, PCtoReg, MemToReg, RegWrite, rs, rt, rd, adder,signExtend,ALUMux, MemWrite_out, MemRead_out, ALUOP_out, JumpMem_out, Jump_out, BranchZero_out, BranchNeg_out, PCtoReg_out, MemToReg_out, RegWrite_out, rs_out, rt_out, rd_out, adder_out, signExtend_out, ALUMux); 
    ID_EX idex(clock, MemWrite_Control_To_IDEX, MemRead_Control_To_IDEX, ALUOP_Control_To_IDEX, JumpMem_Control_To_IDEX, Jump_Control_To_IDEX,  BranchZero_Control_To_IDEX, BranchNeg_Control_To_IDEX, PCtoReg_Control_To_IDEX, MemToReg_Control_To_IDEX, RegWrite_Control_To_IDEX, rs_Reg_To_IDEX, rt_Reg_To_IDEX, IFID_Out[27:22], Adder_To_IDEX, SignExtend_Out, ALUMux_Control_To_IDEX, MemWrite_IDEX_To_DataMem, MemRead_IDEX_To_DataMem, ALUop_IDEX_To_ALU, JumpMem_IDEX_To_EXWB, Jump_IDEX_To_EXWB, BranchZero_IDEX_To_EXWB, BranchNeg_IDEX_To_EXWB,  PCToReg_IDEX_To_EXWB, MemToReg_IDEX_To_EXWB, RegWrite_IDEX_To_EXWB, rs_IDEX_Out, rt_IDEX_Out, rd_IDEX_To_EXWB, SignExtendAdder_IDEX_To_EXWB, SignExtend_IDEX_To_ALUMux, ALUMux_IDEX_To_ALUMux);
    //ID_EX idex(clock, 1, 1, 4'b1000, 0, 0,  1, 1, 0, 0, 1, 2, 3, 4, 6, 9, MemWrite_IDEX_To_DataMem, MemRead_IDEX_To_DataMem, ALUop_IDEX_To_ALU, JumpMem_IDEX_To_EXWB, Jump_IDEX_To_EXWB, BranchZero_IDEX_To_EXWB, BranchNeg_IDEX_To_EXWB,  PCToReg_IDEX_To_EXWB, MemToReg_IDEX_To_EXWB, RegWrite_IDEX_To_EXWB, rs_IDEX, rt_IDEX, rd_IDEX_To_EXWB, SignExtendAdder_IDEX_To_EXWB, SignExtend_IDEX_To_ALUMux);

//EX Stage
    
    //ALU mux
    //module muxTwoToOne(A, B, select, out);
    //muxTwoToOne ALUMux(rt_IDEX_Out, SignExtend_IDEX_To_ALUMux, ALUMux_IDEX_To_ALUMux, ALUMux_To_ALU);
    //muxTwoToOne ALUMux(3, 5, 1, ALUMux_To_ALU);
    //muxTwoToOne ALUMux(3, 5, 0, ALUMux_To_ALU); //expect 3 instead of 5 now because select is 0
    muxTwoToOne ALUMux(rt_IDEX_Out, SignExtend_IDEX_To_ALUMux, ALUMux_IDEX_To_ALUMux, ALUMux_To_ALU);

    //add, inc, neg, sub are the four lines within the ALUop wire
    //module ALU(B, A,add,inc,neg,sub,out,Z,N);
    //ALU alu(rs_IDEX_To_ALU, ALUMux_To_ALU, ALUop_IDEX_To_ALU[3], ALUop_IDEX_To_ALU[2], ALUop_IDEX_To_ALU[1], ALUop_IDEX_To_ALU[0], ALU_To_EXWB, ZFlag_ALU_To_EXWB, NFlag_To_EXWB);
    //ALU alu(1, 7, 1, 0, 0, 0, ALU_To_EXWB, ZFlag_ALU_To_EXWB, NFlag_ALU_To_EXWB);   //expect 8, 0, 0
    //ALU alu(1, 7, 0, 0, 0, 1, ALU_To_EXWB, ZFlag_ALU_To_EXWB, NFlag_ALU_To_EXWB);   //expect -6, 1, 0
    //ALU alu(7, 7, 0, 0, 0, 1, ALU_To_EXWB, ZFlag_ALU_To_EXWB, NFlag_ALU_To_EXWB);   //expect 0, 0, 1
    ALU alu(ALUMux_To_ALU, rs_IDEX_Out, ALUop_IDEX_To_ALU[3], ALUop_IDEX_To_ALU[2], ALUop_IDEX_To_ALU[1], ALUop_IDEX_To_ALU[0], ALU_To_EXWB, ZFlag_ALU_To_EXWB, NFlag_ALU_To_EXWB);


    //module dataMemory(clock, memWrite, memRead, inputAddr, data_in, data_out);
    //dataMemory dataMem(clock, MemWrite_IDEX_To_DataMem,  MemRead_IDEX_To_DataMem, rs_IDEX_To_DataMem,  rt_IDEX_To_DataMem, DataMem_To_EXWB);
    //dataMemory dataMem(clock, 1,  0, 3,  9, DataMem_To_EXWB);   //writing to dataMem at addr = 3 and data in = 9, so expecting no value for DataMem_To_EXWB
    //dataMemory dataMem(clock, 0, 1, 2, 9, DataMem_To_EXWB);   //reading from data at addr = 2, and hardcoded data mem to 5 at addr 2, so expecting DataMem_To_EXWB = 5
    dataMemory dataMem(clock, MemWrite_IDEX_To_DataMem,  MemRead_IDEX_To_DataMem, rs_IDEX_Out, rt_IDEX_Out, DataMem_To_EXWB);

    //module EX_WB(clk, N,Z, JumpMem, Jump, BranchZero,BranchNeg, PCtoReg, MemToReg, RegWrite, ALU, DataMem, rd, adder, N_out, Z_out, JumpMem_out, Jump_out, BranchZero_out, BranchNeg_out, PCtoReg_out, MemToReg_out, RegWrite_out, ALU_out, DataMem_out, rd_out, adder_out);
    //EX_WB exwb(clock, NFlag_ALU_To_EXWB, ZFlag_ALU_To_EXWB, JumpMem_IDEX_To_EXWB, Jump_IDEX_To_EXWB, BranchZero_IDEX_To_EXWB, BranchNeg_IDEX_To_EXWB, PCToReg_IDEX_To_EXWB, MemToReg_IDEX_To_EXWB, RegWrite_IDEX_To_EXWB, ALU_To_EXWB,  DataMem_To_EXWB,  rd_IDEX_To_EXWB, SignExtendAdder_IDEX_To_EXWB, NFlag_EXWB_To_Gate, ZFlag_EXWB_To_Gate, JumpMem_EXWB_To_PCMux, Jump_EXWB_To_Gate, BranchZero_EXWB_To_Gate, BranchNeg_EXWB_To_Gate, PCtoReg_EXWB_To_WBMux, MemToReg_EXWB_To_WBMux, RegWrite_EXWB_To_Reg, ALU_EXWB_To_WBMux, DM_EXWB_out,  rd_EXWB_To_Reg, Adder_EXWB_To_WBMux);
    //EX_WB exwb(clock, 0, 1, 1, 0, 1, 0, 1, 0, 1, 19, 23, 3, 12, NFlag_EXWB_To_Gate, ZFlag_EXWB_To_Gate, JumpMem_EXWB_To_PCMux, Jump_EXWB_To_Gate, BranchZero_EXWB_To_Gate, BranchNeg_EXWB_To_Gate, PCtoReg_EXWB_To_WBMux, MemToReg_EXWB_To_WBMux, RegWrite_EXWB_To_Reg, ALU_EXWB_Out, DM_EXWB_Out, rd_EXWB_To_Reg, Adder_EXWB_To_WBMux);
    //expect Nflag out = 0, zflag out = 1, jumpMem = 1, jump = 0, BranchZ = 1, BranchN = 0, PCToReg = 1, MemToReg = 0, RegWrite = 1, ALU_EXWB_Out = 19, DataMem_EXWB_Out = 23, rd = 3, SignExtendAdder = 12
    //19 input for ALU -> 13?    and     23 input for DataMem -> 17?
    //EX_WB exwb(clock, 0, 1, 1, 0, 1, 0, 1, 0, 1, 32'b00000000000000000000000000001001, 32'b00000000000000000000000000010001, 3, 12, NFlag_EXWB_To_Gate, ZFlag_EXWB_To_Gate, JumpMem_EXWB_To_PCMux, Jump_EXWB_To_Gate, BranchZero_EXWB_To_Gate, BranchNeg_EXWB_To_Gate, PCtoReg_EXWB_To_WBMux, MemToReg_EXWB_To_WBMux, RegWrite_EXWB_To_Reg, ALU_EXWB_Out, DM_EXWB_Out, rd_EXWB_To_Reg, Adder_EXWB_To_WBMux);
    //expect Nflag out = 0, zflag out = 1, jumpMem = 1, jump = 0, BranchZ = 1, BranchN = 0, PCToReg = 1, MemToReg = 0, RegWrite = 1, ALU_EXWB_Out = 9, DataMem_EXWB_Out = 17, rd = 3, SignExtendAdder = 12
    EX_WB exwb(clock, NFlag_ALU_To_EXWB, ZFlag_ALU_To_EXWB, JumpMem_IDEX_To_EXWB, Jump_IDEX_To_EXWB, BranchZero_IDEX_To_EXWB, BranchNeg_IDEX_To_EXWB, PCToReg_IDEX_To_EXWB, MemToReg_IDEX_To_EXWB, RegWrite_IDEX_To_EXWB, ALU_To_EXWB, DataMem_To_EXWB, rd_IDEX_To_EXWB, SignExtendAdder_IDEX_To_EXWB, NFlag_EXWB_To_Gate, ZFlag_EXWB_To_Gate, JumpMem_EXWB_To_PCMux, Jump_EXWB_To_Gate, BranchZero_EXWB_To_Gate, BranchNeg_EXWB_To_Gate, PCtoReg_EXWB_To_WBMux, MemToReg_EXWB_To_WBMux, RegWrite_EXWB_To_Reg, ALU_EXWB_Out, DM_EXWB_Out, rd_EXWB_To_Reg, Adder_EXWB_To_WBMux);


//WB stage
    
    //WBMux or Write back mux
    //module muxThreeToOne(A, B, C, select1, select0, out);
    //MemToReg is select0 and PCToReg is select1
    //muxThreeToOne WBMux(ALU_EXWB_Out, DM_EXWB_Out, Adder_EXWB_To_WBMux, PCtoReg_EXWB_To_WBMux, MemToReg_EXWB_To_WBMux, WBMux_Out_To_Reg);
    //muxThreeToOne WBMux(12, 15, 18, 0, 1, WBMux_Out_To_Reg);    //expect WBMux_Out_To_Reg = 15 because select = 01 so selects 15
    //muxThreeToOne WBMux(12, 15, 18, 0, 0, WBMux_Out_To_Reg);    //expect WBMux_Out_To_Reg = 12 because select = 00 so selects 12
    //muxThreeToOne WBMux(12, 15, 18, 1, 0, WBMux_Out_To_Reg);    //expect WBMux_Out_To_Reg = 12 because select = 10 so selects 18
    muxThreeToOne WBMux(ALU_EXWB_Out, DM_EXWB_Out, Adder_EXWB_To_WBMux, PCtoReg_EXWB_To_WBMux, MemToReg_EXWB_To_WBMux, WBMux_Out_To_Reg);

    //gates
    //module flagGates(NFlag, ZFlag, BranchNeg, BranchZero, Jump, Branch);
    //flagGates Gates(NFlag_EXWB_To_Gate, ZFlag_EXWB_To_Gate, BranchNeg_EXWB_To_Gate, BranchZero_EXWB_To_Gate, Jump_EXWB_To_Gate, Branch_Gate_To_PCMux);
    //flagGates Gates(1, 0, 1, 0, 0, Branch_Gate_To_PCMux);   //expect Branch_Gate_To_PCMux = 1
    //flagGates Gates(0, 0, 1, 0, 0, Branch_Gate_To_PCMux);   //expect Branch_Gate_To_PCMux = 0
    //flagGates Gates(0, 1, 1, 1, 0, Branch_Gate_To_PCMux);   //expect Branch_Gate_To_PCMux = 1
    flagGates Gates(NFlag_EXWB_To_Gate, ZFlag_EXWB_To_Gate, BranchNeg_EXWB_To_Gate, BranchZero_EXWB_To_Gate, Jump_EXWB_To_Gate, Branch_Gate_To_PCMux);

    initial
    begin
        clock = 1'b0;
        forever #5 clock = ~clock;
    end
    
    /*initial
    begin
        #1000;
    $finish;
    end*/
endmodule

module pcAdder(A, B, sum);
    input [7:0] A;
    input [7:0] B;
    
    output [31:0] sum;
    
    wire [7:0] carry;
    
    //using oneBitAdder(A,B,cin,cout,out); from ALU.v
    oneBitAdder b0(A[0], B[0], 1'b0, carry[0], sum[0]);   //bit 0 has cin = 0 because there is no cin value
    oneBitAdder b1(A[1], B[1], carry[0], carry[1], sum[1]);   //bit 1
    oneBitAdder b2(A[2], B[2], carry[1], carry[2], sum[2]);   //bit 2
    oneBitAdder b3(A[3], B[3], carry[2], carry[3], sum[3]);   //bit 3
    oneBitAdder b4(A[4], B[4], carry[3], carry[4], sum[4]);   //bit 4
    oneBitAdder b5(A[5], B[5], carry[4], carry[5], sum[5]);   //bit 5
    oneBitAdder b6(A[6], B[6], carry[5], carry[6], sum[6]);   //bit 6
    oneBitAdder b7(A[7], B[7], carry[6], carry[7], sum[7]);   //bit 7
    
    assign sum[31:8] = 24'b000000000000000000000000;
    
endmodule


module muxTwoToOne(A, B, select, out);
    input [31:0] A;
    input [31:0] B;
    input select;
    
    output reg [31:0] out;
    
    always @ (A, B, select)
    begin
        if(select == 1'b0) begin
            out = A;
        end 
        else 
            begin
            out = B;
        end 
    end

endmodule


module muxThreeToOne(A, B, C, select1, select0, out);
    input [31:0] A;
    input [31:0] B;
    input [31:0] C;
    input select1;
    input select0;
    
    output reg [31:0] out;
    
    always @ (A, B, C, select1, select0)
    begin
        if(select1 == 1'b0 && select0 == 1'b0) begin    //if select lines = 0, select A
            out = A;
        end
        if(select1 == 1'b0 && select0 == 1'b1) begin    //if select lines = 1, select B
            out = B;
        end
        if(select1 == 1'b1 && select0 == 1'b0) begin    //if select lines = 2, select C
            out = C;
        end 
    end

endmodule
