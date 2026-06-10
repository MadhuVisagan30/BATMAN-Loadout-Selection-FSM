`timescale 1ns / 1ps

module tb_PIPO(

    );
    
    reg clk, reset;
    reg [3:0] D;
    wire [3:0] Q;
    
    PIPO dut(clk, reset, D, Q);
    
    initial begin
        clk = 0;
        reset = 1;
        D = 4'b0000;
    end
    
    always #10 clk = ~clk;
    
    initial begin
        #15 reset = 0;      // t = 15

        #20 D = 4'd5;       // 0101
        #20 D = 4'd10;      // 1010
        #20 D = 4'd15;      // 1111
        #20 D = 4'd3;       // 0011
        #20 D = 4'd12;      // 1100

        #40;
        $finish;
    end
    
    initial
    $monitor("t=%0t D=%b Q=%b",
              $time, D, Q);

endmodule