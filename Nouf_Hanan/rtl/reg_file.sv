// Module: reg_file.sv

module reg_file (
    input logic clk,                       // Clock signal
    input logic reset_n,                   // Asynchronous active low reset signal
    input logic reg_write,                 // Write enable signal
    input logic [4:0] raddr1, raddr2, waddr, // Register indices for reading and writing
    input logic [31:0] wdata,              // Data to write to the specified register
    output logic [31:0] rdata1, rdata2     // Data read from the specified registers
);

    // 32x32 register array
    logic [31:0] registers [31:0];

    // Initialize all registers to 0 on reset
    always_ff @(posedge clk ,negedge reset_n) 
        begin
            if (!reset_n) begin
                for (int i = 0; i < 32; i++) begin
                    registers[i] <= 32'b0;
           end
        end 
          else if (reg_write && waddr != 5'd0)
             begin
                registers[waddr] <= wdata; // Write data to the specified register
               end
    end

    always_comb begin
        rdata1 = (raddr1 == 5'd0) ? 32'b0 : registers[raddr1]; // x0 is always 0
        rdata2 = (raddr2 == 5'd0) ? 32'b0 : registers[raddr2]; // x0 is always 0
    end

endmodule
