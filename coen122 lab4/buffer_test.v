`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Yen-Jung Lu
// 
// Create Date: 02/05/2022 02:38:25 PM
// Design Name: 
// Module Name: buffer_test
// Project Name: COEN122 Lab4 buffer test
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


//module description: testbench for module IF_ID 
module buffer_test();

    //initialize the clock
    reg clk;
    reg [31:0] IF;
    wire [31:0] ID;

	
    //test cases
    IF_ID test_if_id (clk, IF,IF,ID,ID);
    
    initial
    begin //initialization of the clock
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial
    begin 
        IF = 1;
        #50;
        
        IF = 2;
        #50;
        
        IF = 3;
        #50;
        
     
    $finish;
    end
endmodule