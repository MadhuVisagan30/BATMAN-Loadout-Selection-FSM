`timescale 1ns / 1ps

module PIPO(input clk,reset,input [3:0] D,output [3:0] Q);
    d_ff one(clk,D[0],reset,Q[0]);
    d_ff two(clk,D[1],reset,Q[1]);
    d_ff three(clk,D[2],reset,Q[2]);
    d_ff four(clk,D[3],reset,Q[3]);    
endmodule
module d_ff(input clk,d,reset,output reg q);
    always @(posedge clk or posedge reset)begin
        if(reset)
            q<=1'b0;
        else
            q<=d;
        end
        endmodule
