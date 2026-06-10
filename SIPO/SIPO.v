`timescale 1ns / 1ps

module SIPO(input clk,D,reset,output [3:0]Q);
    d_ff one(clk,D,reset,Q[0]);
    d_ff two(clk,Q[0],reset,Q[1]);
    d_ff three(clk,Q[1],reset,Q[2]);
    d_ff four(clk,Q[2],reset,Q[3]);
    
endmodule
module d_ff(input clk,d,reset,output reg q);
    always @(posedge clk or posedge reset)begin
        if(reset)
            q<=1'b0;
        else
            q<=d;
        end
        endmodule
