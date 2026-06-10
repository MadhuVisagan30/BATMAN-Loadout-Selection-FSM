`timescale 1ns / 1ps
module tb_batman_loadout(

    );
    reg clk,reset,select,next;
    wire idle,bat_mobile,bat_wing,bat_boat,batarang,smoke_bomb,loadout_ready,weapon_selected;
    wire [2:0] state_out;
    wire [1:0] vehicle_selected;
    
    BATMAN_LOADOUT dut(clk,reset,select,next,idle,bat_mobile,bat_wing,bat_boat,batarang,smoke_bomb,loadout_ready,state_out,vehicle_selected,weapon_selected);
    
    initial begin
        clk=0;
        reset=1;
        select=0;
        next=0;
        end
        
        always #10 clk=~clk;
        
    initial begin
        #15 reset=0;
        
        #20 next=1;
        #20 next=0;
        
        #20 next=1;
        #20 next=0;
        
        #20 select=1;
        #20 select=0;
        
        #20 next=1;
        #20 next=0;
        
        #20 select=1;
        #20 select=0;
        
        #100;
        $finish;
        end
        
        initial $monitor("t=%0t clk=%b reset=%b next=%b select=%b state_out=%b idle=%b bat_mobile=%b bat_wing=%b bat_boat=%b batarang=%b smoke_bomb=%b loadout_ready=%b vehicle_selected=%b weapon_selected=%b",
        $time,clk,reset,next,select,state_out,idle,bat_mobile,bat_wing,bat_boat,batarang,smoke_bomb,loadout_ready,vehicle_selected,weapon_selected);
endmodule
