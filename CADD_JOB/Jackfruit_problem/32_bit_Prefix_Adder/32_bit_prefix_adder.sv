module Prefix_Adder (
    input logic [31:0] A, // 32-bit input A
    input logic [31:0] B, // 32-bit input B
    output logic [31:0] Sum // 32-bit sum output
);
    logic [31:0] G, P, C;

    // Pre-processing
    assign G = A & B; // Generate
    assign P = A ^ B; // Propagate

    // Prefix computation
    assign C[0] = 0;
    genvar i;
    generate
        for (i = 1; i < 32; i = i + 1) begin : prefix
            assign C[i] = G[i-1] | (P[i-1] & C[i-1]);
        end
    endgenerate

    // Post-processing
    assign Sum = P ^ C;

endmodule
