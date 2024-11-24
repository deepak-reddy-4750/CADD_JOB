module Pipelined_Prefix_Adder (
    input logic [31:0] A, // 32-bit input A
    input logic [31:0] B, // 32-bit input B
    input logic clk,      // Clock input
    output logic [31:0] Sum // 32-bit sum output
);
    logic [31:0] G, P, C;
    logic [31:0] G_reg, P_reg, C_reg;

    // Pre-processing
    always_ff @(posedge clk) begin
        G_reg <= A & B; // Generate
        P_reg <= A ^ B; // Propagate
    end

    // Prefix computation
    always_ff @(posedge clk) begin
        C_reg[0] <= 0;
        for (int i = 1; i < 32; i++) begin
            C_reg[i] <= G_reg[i-1] | (P_reg[i-1] & C_reg[i-1]);
        end
    end

    // Post-processing
    always_ff @(posedge clk) begin
        Sum <= P_reg ^ C_reg;
    end

endmodule
