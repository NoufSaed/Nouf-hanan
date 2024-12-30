module inst_mem
 // #(parameter n=32)
    (
    input [31:0]address,
    output logic[31:0] instruction
    );
logic [31:0] imem [0:255];
  initial begin
$readmemh("home/it/Downloads/CX-204-Labs/Lab6/Machine.hex",imem);
end
// Fetch instruction based on address
   assign instruction = imem[address[9:2]]; // Using address[9:2] for word addressing
endmodule