`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2024 16:32:04
// Design Name: 
// Module Name: program_counter_tb
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


module program_counter_tb;
parameter n=32;
logic clk;           
logic reset_n;      
logic [n-1:0] data_in;
 logic [n-1:0] data_o;
 
 program_counter dut
 (
    .clk(clk),
    .reset_n(reset_n),
    .data_in(data_in),
    .data_o(data_o) 
 );
 
 always#5 clk=~clk;
 initial begin
 clk=1;
 reset_n=0;
 #10
    data_in= 32'h00000010;#10
    data_in= 32'h00000020;#10
    data_in= 32'h00000030;#10
    
     reset_n=1;#10
     reset_n=0;#10
     
    data_in= 32'h00000040;#10
    data_in= 32'h00000050;#10
    $finish;
 end
endmodule
