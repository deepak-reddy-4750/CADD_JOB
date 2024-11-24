module FP_Multiplier (
    input logic [31:0] A, // 32-bit floating-point input A
    input logic [31:0] B, // 32-bit floating-point input B
    output logic [31:0] Result // 32-bit floating-point result
);
    logic signA, signB, signResult;
    logic [7:0] expA, expB, expResult;
    logic [23:0] mantA, mantB, mantResult;
    logic [47:0] mantProduct;
    logic [7:0] expSum;
    logic [7:0] expBias = 8'd127;

    // Extract sign, exponent, and mantissa
    assign signA = A[31];
    assign signB = B[31];
    assign expA = A[30:23];
    assign expB = B[30:23];
    assign mantA = {1'b1, A[22:0]};
    assign mantB = {1'b1, B[22:0]};

    // Calculate sign of the result
    assign signResult = signA ^ signB;

    // Add exponents and subtract bias
    assign expSum = expA + expB - expBias;

    // Multiply mantissas
    assign mantProduct = mantA * mantB;

    // Normalize the result
    assign mantResult = mantProduct[47] ? mantProduct[46:24] : mantProduct[45:23];
    assign expResult = mantProduct[47] ? expSum + 1 : expSum;

    // Assemble the final result
    assign Result = {signResult, expResult, mantResult[22:0]};

endmodule
