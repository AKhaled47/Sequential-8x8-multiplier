module mult_control_tb;
reg clk,reset_a,start;
reg [1:0] count;
wire sclr_n,clk_ena,done;
wire [2:0]  state_out;
wire [1:0] input_sel,shift_sel;
mult_control U1 (clk,reset_a,start,count,input_sel,shift_sel,state_out,done,clk_ena,sclr_n);

initial begin
    clk=1'b0;
    forever
        #5 clk=~clk;
    
end

initial
begin
reset_a=1'b0;start=1'b0;
#10 reset_a=1'b1;
#10 start=1'b1;
#10 start=1'b0;count=2'b00;
#10 start=1'b0;count=2'b01;
#10 start=1'b0;count=2'b10;
#10 start=1'b0;count=2'b11;
$monitor("Time is %3d ,State out is %b,input sel is %b ,shift sel is %b ,done is %b, clk_ena is %b, sclr_n is %b",$time,state_out ,input_sel,shift_sel,done,clk_ena,sclr_n);


end
endmodule