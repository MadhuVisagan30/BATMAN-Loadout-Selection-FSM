`timescale 1ns / 1ps

module tb_SIPO(

    );
    reg clk,D,reset;
    wire [3:0] Q;
    
    SIPO dut(clk,D,reset,Q[3:0]);
       
    initial 
    begin
        reset=1;
        D=0;
        clk=0;
        end
        always #10 clk=~clk;
        
   initial begin
        
        #10 reset=0;
        #15 D=1;
        #20 D=0;
        #20 D=1;
        #20 D=1;
        #20 D=0;
        #20 D=0;
        #20 D=1;
        #20 D=0;
        #20 D=1;
        #20 D=1;
        #10;
        $finish;
        end
        
        initial $monitor("t=%0t D=%b Q[0]=%b Q[1]=%b Q[2]=%b Q[3]=%b",$time,D,Q[0],Q[1],Q[2],Q[3]);
        
        
endmodule
