module BCD_adder (
    input [7:0] A, // 8-bit BCD input A
    input [7:0] B, // 8-bit BCD input B
    input Cin,     // Carry input
    output [7:0] S, // 8-bit BCD sum output
    output Cout    // Carry output
);
    wire [3:0] sum0, sum1;
    wire c0, c1, c2;

    // Instantiate two 4-bit BCD adders
    BCD_4bit_Adder adder0 (.A(A[3:0]), .B(B[3:0]), .Cin(Cin), .S(sum0), .Cout(c0));
    BCD_4bit_Adder adder1 (.A(A[7:4]), .B(B[7:4]), .Cin(c0), .S(sum1), .Cout(c1));

    assign S = {sum1, sum0};
    assign Cout = c1;

endmodule

module BCD_4bit_Adder (
    input [3:0] A, // 4-bit BCD input A
    input [3:0] B, // 4-bit BCD input B
    input Cin,     // Carry input
    output [3:0] S, // 4-bit BCD sum output
    output Cout    // Carry output
);
    wire [4:0] sum;
    wire [3:0] corrected_sum;
    wire correction_needed;

    // Add the BCD digits and the carry input
    assign sum = A + B + Cin;

    // Check if correction is needed (sum > 9)
    assign correction_needed = (sum > 9);

    // Correct the sum if needed
    assign corrected_sum = correction_needed ? (sum + 6) : sum;

    // Assign the corrected sum and carry output
    assign S = corrected_sum[3:0];
    assign Cout = correction_needed;

endmodule

