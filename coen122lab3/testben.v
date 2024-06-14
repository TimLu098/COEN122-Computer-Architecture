`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2022 10:32:29 AM
// Design Name: 
// Module Name: testben
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


module testben();

reg clock;

//module instruct_mem
//initialize instruction memory variables and test_

reg [7:0] address8;

wire [31:0] ins;

instruction_mem testi(clock,address8,ins);

//module register
//initialize register variables and test_

reg write;
reg [5:0] rd;
reg [5:0] rs;
reg [5:0] rt;
reg  [31:0] writein;

wire [31:0] rsout;
wire [31:0] rtout;

//register testr(clock, write,rd,rs,rt,writein,rsout,rtout);
//module data
//initialize data variables and test_

reg dwrite;
reg read;
reg [31:0] addin;
reg [31:0] dwritein;

wire [31:0] dataout;

//data testd(clock,dwrite,read,addin,dwritein,dataout);


//initialize clock thread
initial
begin
    clock = 0;
    forever #50 clock = ~clock;
end



//initialize test cases
initial 
begin
    //module data
        //write 7 into blocks[2]
        dwrite = 1;
        read = 0;
        addin = 2;
        dwritein = 7;
        
        #100
        //read 7 from blocks[2] into dataout
        dwrite = 0;
        read = 1;
        
        
        #100
    //module instruct_mem
        //read inst mem
        //hardcode instruction
        //assign instruc[100] = 11;
        
        address8 = 100;
        
        #100
    
        //read inst mem
        //hardcode instruction
        //assign instruc[101] = 12;
        
        address8 = 101;
        
        #100
        
    
    //module register
        //write registers
        //regis[10] = 10
        
        write = 1;
        writein = 10;
        rt = 10;
        
        #100
        //regis[11] = 11;
        
        writein = 11;
        rt = 11;
        
        #100
        
        //read registers
        //read regis[10,11]
        
        write = 0;
        
        rd = 10;
        rs = 11;
        
       
   


end
endmodule
