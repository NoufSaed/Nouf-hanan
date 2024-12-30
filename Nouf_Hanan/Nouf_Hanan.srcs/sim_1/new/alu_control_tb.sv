`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.12.2024 02:08:24
// Design Name: 
// Module Name: alu_control_tb
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


module alu_tb;


   
    logic [31:0] op1, op2;         
    logic [3:0] alu_ctrl;          
    logic [31:0] alu_result;       
    logic zero;                    

    
    alu uut (
        .op1(op1),
        .op2(op2),
        .alu_ctrl(alu_ctrl),
        .alu_result(alu_result),
        .zero(zero)
    );

   
    initial begin

        // test add
        op1 = 32'd10; op2 = 32'd20; alu_ctrl = 4'b0000;
        #10;

        // test sub
        op1 = 32'd20; op2 = 32'd10; alu_ctrl = 4'b1000;
        #10;

        // test and
        op1 = 32'hFF00FF00; op2 = 32'h00FF00FF; alu_ctrl = 4'b0111;
        #10;

        // test or
        op1 = 32'hFF00FF00; op2 = 32'h00FF00FF; alu_ctrl = 4'b0110;
        #10;

        // test xor
        op1 = 32'hF0F0F0F0; op2 = 32'h0F0F0F0F; alu_ctrl = 4'b0100;
        #10;

        // test sll
        op1 = 32'h00000001; op2 = 32'd4; alu_ctrl = 4'b0001;
        #10;

        // test srl
        op1 = 32'h00000010; op2 = 32'd2; alu_ctrl = 4'b0101;
        #10;

        // test sra
        op1 = 32'h80000000; op2 = 32'd4; alu_ctrl = 4'b1101;
        #10;

        // test slt
        op1 = 32'd10; op2 = 32'd20; alu_ctrl = 4'b0010;
        #10;

        // test sltu
        op1 = 32'hFFFFFFF0; op2 = 32'h00000010; alu_ctrl = 4'b0011;
        #10;

        $finish;
    end

endmodule



