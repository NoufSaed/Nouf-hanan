`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2024 12:54:34
// Design Name: 
// Module Name: alu_control
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


module program_counter 
#(parameter n = 32 )
(
    input logic clk,              
    input logic reset_n,          
    input logic [n-1:0] data_in,  
    output logic [n-1:0] data_o   
);

    logic [n-1:0] pc_reg;

        always_ff @(posedge clk or negedge reset_n) 
        begin
        if (!reset_n) begin
            pc_reg <= {n{1'b0}};  
        end 
        else if (pc_reg<n-1)
        begin
        pc_reg<= pc_reg+4;
        end
        
        else begin
            pc_reg <= data_in;    
        end
    end

 
    assign data_o = pc_reg;

endmodule
