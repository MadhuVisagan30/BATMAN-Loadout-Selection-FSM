`timescale 1ns / 1ps


module BATMAN_LOADOUT(input clk,reset,select,next,output reg idle,bat_mobile,bat_wing,bat_boat,batarang,smoke_bomb,loadout_ready,output [2:0]state_out,output reg [1:0] vehicle_selected,
 output reg weapon_selected);

parameter IDLE=3'b000,BAT_MOBILE=3'b001,BAT_WING=3'b010,BAT_BOAT=3'b011,BATARANG=3'b100,SMOKE_BOMB=3'b101,CONFIRM=3'b110;
reg [2:0]state,next_state;

always @(posedge clk or posedge reset)begin
    if (reset)begin
        state<=IDLE;
        vehicle_selected<=0;
        weapon_selected<=0; end
    else begin
        state <= next_state;
        if(select & (state==BAT_MOBILE)) vehicle_selected<=2'd1;
        else if(select & (state==BAT_WING)) vehicle_selected<=2'd2;
        else if(select & (state==BAT_BOAT)) vehicle_selected<=2'd3;
        else if(select & (state==BATARANG)) weapon_selected<=1'd0;
        else if(select & (state==SMOKE_BOMB)) weapon_selected<=1'd1; end
end

always @(*)begin
    case(state)
        IDLE:begin if(select|next)
                        next_state=BAT_MOBILE;
                   else
                        next_state=IDLE; end
        BAT_MOBILE:begin if(select) next_state=BATARANG;
                        else if(next) next_state=BAT_WING;
                        else next_state=state; end
        BAT_WING:begin if(select) next_state=BATARANG;
                        else if(next) next_state=BAT_BOAT;
                        
                        else next_state=state;  end  
        BAT_BOAT:begin if(select) next_state=BATARANG;
                        else if(next) next_state=BAT_MOBILE;
                        
                        else next_state=state;  end
        BATARANG:begin if(select) next_state=CONFIRM;
                        else if(next) next_state=SMOKE_BOMB;
                        
                        else next_state=state;  end 
        SMOKE_BOMB:begin if(select) next_state=CONFIRM;
                        else if(next) next_state=BATARANG;
                        
                        else next_state=state;  end
        CONFIRM:next_state=CONFIRM;
        default:next_state=IDLE;
                        endcase
                        end
  
  
                        
always @(*)begin
    
    idle=0;bat_mobile=0;bat_wing=0;bat_boat=0;batarang=0;smoke_bomb=0;loadout_ready=0;
    
    case(state)
    IDLE:idle=1;
    BAT_MOBILE: bat_mobile=1;
    BAT_WING: bat_wing=1;
    BAT_BOAT: bat_boat=1;
    BATARANG: batarang=1;
    SMOKE_BOMB: smoke_bomb=1;
    CONFIRM:loadout_ready=1;
    default:idle=1;endcase
   end
   assign state_out=state;
                    
                               
        
endmodule
