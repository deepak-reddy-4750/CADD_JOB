module BCD_Adder_tb;
    reg [7:0] A, B;
    reg Cin;
    wire [7:0] S;
    wire Cout;

    // Instantiate the BCD adder
    BCD_Adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        // Test case 1
        A = 8'b00010010; // 12 in BCD
        B = 8'b00000101; // 5 in BCD
        Cin = 0;
        #10;
        $display("A = %b, B = %b, Cin = %b, S = %b, Cout = %b", A, B, Cin, S, Cout);

        // Test case 2
        A = 8'b00011001; // 19 in BCD
        B = 8'b00001001; // 9 in BCD
        Cin = 0;
        #10;
        $display("A = %b, B = %b, Cin = %b, S = %b, Cout = %b", A, B, Cin, S, Cout);

        // Test case 3
        A = 8'b00100100; // 24 in BCD
        B = 8'b00010110; // 16 in BCD
        Cin = 1;
        #10;
        $display("A = %b, B = %b, Cin = %b, S = %b, Cout = %b", A, B, Cin, S, Cout);

        $finish;
    end
endmodule
