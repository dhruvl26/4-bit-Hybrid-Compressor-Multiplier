`timescale 1ns / 1ps

module hybrid_compressor_multiplier_tb;
    
    reg [3:0] a;
    reg [3:0] b;
    wire [7:0] f;
    
    hybrid_compressor_multiplier uut (.a(a), .b(b), .f(f));
    
    initial
    begin
    
        a = 4'b0000;
        b = 4'b0000;
        #20;
        
        a = 4'b1000;
        b = 4'b0010;
        #20;
        
        a = 4'b0100;
        b = 4'b1010;
        #20;
        
        a = 4'b1100;
        b = 4'b0110;
        #20;
        
        a = 4'b1111;
        b = 4'b1111;
        #20;
        $finish;
    
    end
    
    
endmodule
