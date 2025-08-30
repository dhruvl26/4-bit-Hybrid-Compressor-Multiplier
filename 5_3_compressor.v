`timescale 1ns / 1ps

module five_three_compressor(
    input x1, x2, x3, x4, cin,
    output s1, s2,
    output cout
    );
    
    wire c1;
    
    three_two_compressor c31 (.A(x1), .B(x2), .cin(cin), .sum(s1), .cout(c1));
    three_two_compressor c32 (.A(x3), .B(x4), .cin(c1), .sum(s2), .cout(cout));
    
endmodule
