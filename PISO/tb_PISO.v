`timescale 1ns / 1ps

module tb_PISO;

    reg clk, reset, shift;
    reg [3:0] D;
    wire Q;

    PISO dut(clk, reset, shift, D, Q);

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        reset = 1;
        shift = 0;
        D = 4'b0000;

        #15 reset = 0;      // t = 15

        #20 D = 4'd5;       // t = 35

        #20 shift = 1;      // t = 55

        #100;

        $finish;
    end

    initial begin
        $monitor("t=%0t clk=%b shift=%b D=%b q1=%b q2=%b q3=%b Q=%b",
                 $time, clk, shift, D,
                 dut.q1, dut.q2, dut.q3, dut.Q);
    end

endmodule
