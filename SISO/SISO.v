`timescale 1ns / 1ps

module SISO(input clk,D,reset,output Q,not_Q);
    wire q1,q2,q3,not_q1,not_q2,not_q3;
    d_ff one(clk,D,reset,q1,not_q1);
    d_ff two(clk,q1,reset,q2,not_q2);
    d_ff three(clk,q2,reset,q3,not_q3);
    d_ff four(clk,q3,reset,Q,not_Q);
endmodule
module d_ff(input clk,d,reset,output reg q,output not_q);
    always @(posedge clk or posedge reset)begin
        if(reset)
            q<=1'b0;
        else
            q<=d;
        end
        assign not_q=~q;
        endmodule
