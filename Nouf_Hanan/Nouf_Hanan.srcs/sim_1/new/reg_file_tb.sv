`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.12.2024 22:16:29
// Design Name: 
// Module Name: reg_file_tb
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


module reg_file_tb;
   logic clk;              
   logic reset_n;          
   logic reg_write;        
   logic [4:0] raddr1, raddr2, waddr;  
   logic [31:0] wdata;     
    
    // output
    logic [31:0] rdata1, rdata2;  

    always #5 clk = ~clk; 
    
    reg_file uut(.*);

    initial begin
        clk = 0;
        reset_n = 0;  
        reg_write = 0;
        raddr1 = 5'b0;
        raddr2 = 5'b1;
        waddr = 5'b0;
        wdata = 32'hA5A5A5A5;

       
     
           #10 reset_n = 1; 
       
           #10 reg_write = 1;
            waddr = 5'b1;  
            wdata = 32'hDEADBEEF;

    
            #10 reg_write = 0;
            raddr1 = 5'b1;   
            raddr2 = 5'b0;  

        #10 reg_write = 1;
            waddr = 5'b0; 
            wdata = 32'hFFFFFFFF;  

        #10 reg_write = 0;
            raddr1 = 5'b0;  
            raddr2 = 5'b1;  

        #10 $finish;
    end

endmodule
