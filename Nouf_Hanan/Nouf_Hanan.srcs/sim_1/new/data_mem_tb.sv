`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.12.2024 15:01:30
// Design Name: 
// Module Name: data_mem_tb
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


module data_mem_tb;
    parameter WIDTH = 32;
    parameter DEPTH = 1024;

    logic clk;
    logic reset_n;
    logic mem_write;
    logic [WIDTH-1:0] addr;
    logic [WIDTH-1:0] wdata;
    logic [WIDTH-1:0] rdata;

    data_mem #(.WIDTH(WIDTH),
        .DEPTH(DEPTH))
          uut (
        .clk(clk),
        .reset_n(reset_n),
        .mem_write(mem_write),
        .addr(addr),
        .wdata(wdata),
        .rdata(rdata)
    );

    always begin
        #5 clk = ~clk;  
    end

    initial begin
        clk = 0;
        reset_n = 0;
        mem_write = 0;
        addr = 0;
        wdata = 0;

        #10 reset_n = 1;
        #10 reset_n = 0;
        #10 reset_n = 1;

        mem_write = 1;
        addr = 4;
        wdata = 32'hB;  
        #10 mem_write = 0; 

        addr = 4;
        #10;  

        mem_write = 1;
        addr = 8;
        wdata = 32'hA;  
        #10 mem_write = 0;

        addr = 8;
        #10;  
        $finish;
    end



endmodule
