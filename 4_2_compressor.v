`timescale 1ns / 1ps

module four_two_compressor(
    input x1, x2, x3, x4,
    input cin,
    output sum,
    output cout, carry
    );
    
    wire s;
    
    three_two_compressor c321( .A(x1), .B(x2), .cin(x3), .sum(s), .cout(cout));
    three_two_compressor c322( .A(s), .B(x4), .cin(cin), .sum(sum), .cout(carry));
    
endmodule
