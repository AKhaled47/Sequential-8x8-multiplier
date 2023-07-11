module mult_control(clk,reset_a,start,count,input_sel,shift_sel,state_out,done,clk_ena,sclr_n);
input clk,reset_a,start;
input [1:0] count;
output reg sclr_n,clk_ena,done;
output reg [2:0]  state_out;
output reg [1:0] input_sel,shift_sel;

reg [2:0] next_state;
parameter [2:0] IDLE=3'b000,LSB=3'b001,MID=3'b010,MSB=3'b011,DONE=3'b100,ERR=3'b101;

always@(*) begin
    next_state=state_out;
case (state_out)
    IDLE:
        if(start)
        begin
          input_sel=2'b00;
          shift_sel=2'b00;
          done=1'b0;
          clk_ena=1'b1;
          sclr_n=1'b0;  
          next_state=LSB;    
        end 
        else
        begin
          input_sel=2'b00;
          shift_sel=2'b00;
          done=1'b0;
          clk_ena=1'b0;
          sclr_n=1'b1;  
          next_state=IDLE;        
        end 
    LSB:
        if(start==1'b0 && count==2'b00)
        begin
          input_sel=2'b00;
          shift_sel=2'b00;
          done=1'b0;
          clk_ena=1'b1;
          sclr_n=1'b1;    
          next_state=MID;       
        end 
        else
        begin
          input_sel=2'b00;
          shift_sel=2'b00;
          done=1'b0;
          clk_ena=1'b0;
          sclr_n=1'b1;   
          next_state=ERR ;  
        end 
    MID:
        if(start==1'b0 && count==2'b01)
        begin
          input_sel=2'b01;
          shift_sel=2'b01;
          done=1'b0;
          clk_ena=1'b1;
          sclr_n=1'b1;    
          next_state=MID;       
        end 
        else if(start==1'b0 && count==2'b10)
        begin
          input_sel=2'b10;
          shift_sel=2'b01;
          done=1'b0;
          clk_ena=1'b1;
          sclr_n=1'b1;   
          next_state=MSB;   
        end 
        else
        begin
          input_sel=2'b00;
          shift_sel=2'b00;
          done=1'b0;
          clk_ena=1'b0;
          sclr_n=1'b1;   
          next_state=ERR ;  
        end 
    MSB:
        if(start==1'b0 && count==2'b11)
        begin
          input_sel=2'b11;
          shift_sel=2'b10;
          done=1'b0;
          clk_ena=1'b1;
          sclr_n=1'b1;    
          next_state=DONE;       
        end 
        else
        begin
          input_sel=2'b00;
          shift_sel=2'b00;
          done=1'b0;
          clk_ena=1'b0;
          sclr_n=1'b1;   
          next_state=ERR;   
        end 
    DONE:
        if(start==1'b0)
        begin
          input_sel=2'b00;
          shift_sel=2'b00;
          done=1'b1;
          clk_ena=1'b0;
          sclr_n=1'b1;    
          next_state=IDLE;       
        end 
        else
        begin
          input_sel=2'b00;
          shift_sel=2'b00;
          done=1'b0;
          clk_ena=1'b0;
          sclr_n=1'b1;   
          next_state=ERR;   
        end    
    ERR:
        if(start==1'b0)
        begin
          input_sel=2'b00;
          shift_sel=2'b00;
          done=1'b0;
          clk_ena=1'b0;
          sclr_n=1'b1;    
          next_state=ERR;       
        end 
        else
        begin
          input_sel=2'b00;
          shift_sel=2'b00;
          done=1'b0;
          clk_ena=1'b1;
          sclr_n=1'b0;   
          next_state=LSB;   
        end    

endcase
end

always@(posedge clk, negedge reset_a)
begin
if(!reset_a)
state_out<=IDLE;
else
state_out<=next_state;
end
endmodule