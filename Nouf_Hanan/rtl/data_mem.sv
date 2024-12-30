
module data_mem #(
    parameter WIDTH = 32,       // Width of each memory word
    parameter DEPTH = 1024      // Number of memory locations
)(
    input  logic                  clk,        // Clock signal
    input  logic                  reset_n,    // Asynchronous active low reset signal
    input  logic                  mem_write,  // Write enable signal
    input  logic [WIDTH-1:0]      addr,       // Memory address
    input  logic [WIDTH-1:0]      wdata,      // Data to write into memory
    output logic [WIDTH-1:0]      rdata       // Data read from memory
);

    // Memory array declaration
    logic [WIDTH-1:0] dmem [0:DEPTH-1];

    
    logic [$clog2(DEPTH)-1:0] aligned_addr;// Processed address to conform to word limits



    assign aligned_addr = addr[$clog2(DEPTH)+1:2]; // Align address to word boundaries

    // Read operation (combinational, no clock required)
    always_comb begin
        if (!reset_n ) begin
            rdata = '0; // Reset read data
        end else begin
            rdata = dmem[aligned_addr]; // read the data from address
        end
    end
///////////////////////////////////////////////////////

    // Write operation (triggered on clock edge)
    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            
                        integer i;
            for (i = 0; i < DEPTH; i = i + 1) begin //every location in memory will be zero 
                dmem[i] <= '0;
            end
        end else if (mem_write) begin // if enable =1 
            dmem[aligned_addr] <= wdata; // Write data to memory
        end
    end


endmodule
