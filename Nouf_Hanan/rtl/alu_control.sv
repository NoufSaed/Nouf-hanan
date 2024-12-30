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


module alu(
input [31:0]op1,op2,
input [3:0]alu_ctrl,
output logic [31:0]alu_result,
output logic zero
    );
    always_comb 
    begin
    case (alu_ctrl)
            4'b0000: alu_result = op1 + op2;         // ADD
            4'b1000: alu_result = op1 - op2;         // SUB
            4'b0001: alu_result = op1 << op2[4:0];   // SLL (Shift Left Logical)
            4'b0010: alu_result = (op1 < op2) ? 32'b1 : 32'b0; // SLT (Set Less Than)
            4'b0011: alu_result = (op1 < op2) ? 32'b1 : 32'b0; // SLTU (Set Less Than Unsigned)
            4'b0100: alu_result = op1 & op2;         // AND
            4'b0101: alu_result = op1 | op2;         // OR
            4'b0110: alu_result = op1 ^ op2;         // XOR (optional but included)
            4'b0111: alu_result = op1 >> op2[4:0];   // SRL (Shift Right Logical)
            4'b1001: alu_result = $signed(op1) >>> op2[4:0]; // SRA (Shift Right Arithmetic)
            default: alu_result = 32'b0;   
    endcase 
  assign  zero =(alu_result==32'd0);
    end
endmodule
