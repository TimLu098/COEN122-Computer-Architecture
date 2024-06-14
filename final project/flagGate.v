`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2022 04:46:58 PM
// Design Name: 
// Module Name: flagGates
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


module flagGates(NFlag, ZFlag, BranchNeg, BranchZero, Jump, Branch);
    //inputs
    input NFlag;
    input ZFlag;
    input BranchNeg;
    input BranchZero;
    input Jump;
    //outputs
    output Branch;
    //wires
    wire NegAndGateOut;
    wire ZeroAndGateOut;
    
    and(NegAndGateOut, NFlag, BranchNeg);
    and(ZeroAndGateOut, ZFlag, BranchZero);
    
    or(Branch, Jump, NegAndGateOut, ZeroAndGateOut);

endmodule
