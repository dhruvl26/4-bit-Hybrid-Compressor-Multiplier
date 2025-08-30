`timescale 1ns / 1ps

module twelve_six_compressor(
    input x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11,
    input cin,
    output s0, s1, s2, s3, s4, s5,
    output cout
    );
    
    wire c1, c2;
    
    four_two_compressor c421 (.x1(x0), .x2(x1), .x3(x2), .x4(x3), .cin(cin), .sum(s0), .carry(s1), .cout(c1));
    four_two_compressor c422 (.x1(x4), .x2(x5), .x3(x6), .x4(x7), .cin(c1), .sum(s2), .carry(s3), .cout(c2));
    four_two_compressor c423 (.x1(x8), .x2(x9), .x3(x10), .x4(x11), .cin(c2), .sum(s4), .carry(s5), .cout(cout));
    
endmodule
