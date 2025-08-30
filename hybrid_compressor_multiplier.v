`timescale 1ns / 1ps

module hybrid_compressor_multiplier(
    input [3:0] a,
    input [3:0] b,
    output [7:0] f
    );
    
    wire [15:0] z;
    wire c1, c2, c3;
    wire [8:0] s;
    
    and_gate a1 (.A(a[0]), .B(b[0]), .Y(z[0]));
    and_gate a2 (.A(a[0]), .B(b[1]), .Y(z[1]));
    and_gate a3 (.A(a[1]), .B(b[0]), .Y(z[2]));
    and_gate a4 (.A(a[0]), .B(b[2]), .Y(z[3]));
    and_gate a5(.A(a[1]), .B(b[1]), .Y(z[4]));
    and_gate a6 (.A(a[2]), .B(b[0]), .Y(z[5]));
    and_gate a7 (.A(a[0]), .B(b[3]), .Y(z[6]));
    and_gate a8 (.A(a[1]), .B(b[2]), .Y(z[7]));
    and_gate a9 (.A(a[2]), .B(b[1]), .Y(z[8]));
    and_gate a10 (.A(a[3]), .B(b[0]), .Y(z[9]));
    and_gate a11 (.A(a[1]), .B(b[3]), .Y(z[10]));
    and_gate a12 (.A(a[2]), .B(b[2]), .Y(z[11]));
    and_gate a13 (.A(a[3]), .B(b[1]), .Y(z[12]));
    and_gate a14 (.A(a[3]), .B(b[2]), .Y(z[13]));
    and_gate a15 (.A(a[2]), .B(b[3]), .Y(z[14]));
    and_gate a16 (.A(a[3]), .B(b[3]), .Y(z[15]));
    
    assign f[0] = z[0]; //f0
    
    half_adder ha1 (.A(z[1]), .B(z[2]), .sum(f[1]), .carry(c1)); //f1
    
    twelve_six_compressor c16 ( .x0(1'b0), .x1(z[3]), .x2(z[4]), 
                                .x3(z[5]), .x4(z[6]), .x5(z[7]), 
                                .x6(z[8]), .x7(z[9]), .x8(1'b0), 
                                .x9(z[10]), .x10(z[11]), .x11(z[12]), .cin(c1),
                                .s0(s[0]), .s1(s[1]), .s2(s[2]), .s3(s[3]), 
                                .s4(s[4]), .s5(s[5]), .cout(c3)); 
                                
    assign f[2] = s[0]; //f2
    
    three_two_compressor c12 (.A(z[14]), .B(z[13]), .cin(c3), .sum(s[6]), .cout(s[7]));
    
    half_adder ha2 (.A(s[1]), .B(s[2]), .sum(f[3]), .carry(c2)); //f3
    
    five_three_compressor c53 (.x1(s[3]), .x2(s[4]), .x3(s[5]), .x4(s[6]), .cin(c2), .s1(f[4]), .s2(f[5]), .cout(s[8])); //f4, f5
    
    three_two_compressor c13 (.A(z[15]), .B(s[7]), .cin(s[8]), .sum(f[6]), .cout(f[7])); //f6, f7
        
endmodule
