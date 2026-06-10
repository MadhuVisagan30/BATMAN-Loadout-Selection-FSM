`timescale 1ns / 1ps

module tb_SISO(

    );
    reg D,clk,reset;
    wire Q,not_Q;
    
    SISO dut(clk,D,reset,Q,not_Q);
    
    initial begin
    clk=0;
    D=0;
    reset=1;
    end 
    always #10 clk=~clk;
    initial begin
    #15 reset=0;
    #15 D=1;
    #20 D=0;
    #20 D=1;
    #20 D=0;
    #20 D=1;
    #20 D=0;
    #20 D=1;
    #20 D=0;
    
    #10;
    $finish;
    
    end
    initial $monitor( "t=%0t D=%b q1=%b q2=%b q3=%b Q=%b",$time,D,dut.q1,dut.q2,dut.q3,Q);
    
    
endmodule
