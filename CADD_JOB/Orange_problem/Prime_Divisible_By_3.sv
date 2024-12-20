module Prime_Divisible_By_3 (
    input logic [3:0] A, // 4-bit input representing a number from 0 to 15
    output logic P,      // Output P is TRUE if the number is prime
    output logic D       // Output D is TRUE if the number is divisible by 3
);
    // Boolean equation for prime numbers (2, 3, 5, 7, 11, 13)
    assign P = (A == 4'd2) | (A == 4'd3) | (A == 4'd5) | (A == 4'd7) | (A == 4'd11) | (A == 4'd13);

    // Boolean equation for numbers divisible by 3 (0, 3, 6, 9, 12, 15)
    assign D = (A == 4'd0) | (A == 4'd3) | (A == 4'd6) | (A == 4'd9) | (A == 4'd12) | (A == 4'd15);
endmodule
