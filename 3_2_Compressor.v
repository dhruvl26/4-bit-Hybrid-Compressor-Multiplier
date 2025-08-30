`timescale 1ns / 1ps

module three_two_compressor(
    input A,
    input B,
    input cin,
    output sum,
    output cout
    );
    
    assign sum = A ^ B ^ cin;
    assign cout = (A & B) | ((A ^ B) & cin);
endmodule
