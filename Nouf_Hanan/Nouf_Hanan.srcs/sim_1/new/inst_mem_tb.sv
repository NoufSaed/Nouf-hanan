`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.12.2024 21:53:29
// Design Name: 
// Module Name: inst_mem_tb
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


module inst_mem_tb;
    
    logic [31:0]address;       
    logic[31:0] instruction;
 
 inst_mem dut(.*);
  initial begin
  address =32'h00000000;#10
   address =32'h00000004;#10
    address =32'h00000008;#10
     address =32'h0000000c;
     $finish;
 end
endmodule
