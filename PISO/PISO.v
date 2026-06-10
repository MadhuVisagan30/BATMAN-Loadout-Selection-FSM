`timescale 1ns / 1ps

module PISO(input clk,reset,shift,input [3:0] D,output Q);
    wire q1,q2,q3,d0,d1,d2,d3,load;
    assign load=~shift;
    
    d_ff one(clk,d0,reset,q1);
    d_ff two(clk,d1,reset,q2);
    d_ff three(clk,d2,reset,q3);
    d_ff four(clk,d3,reset,Q); 
       
    assign d0=(load&D[0]);
    assign d1=(q1&shift)|(load&D[1]);
    assign d2=(q2&shift)|(load&D[2]);
    assign d3=(q3&shift)|(load&D[3]);
endmodule
module d_ff(input clk,d,reset,output reg q);
    always @(posedge clk or posedge reset)begin
        if(reset)
            q<=1'b0;
        else
            q<=d;
        end
        endmodule
