module mult8x8_vedic(
    input [7:0] dataa,datab,
    input start,clk,reset_a,
    output [15:0] product8x8_out,
    output wire done_flag,
    output seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g
);

wire [1:0] sel,shift,count;
wire [2:0] state_out;
wire clk_ena,sclr_n;

wire [3:0] aout,bout;

wire [7:0] product;

wire [15:0] shift_out,sum;
wire cout;

mux4 u1 (dataa[3:0],dataa[7:4],sel[1],aout);
mux4 u2 (datab[3:0],datab[7:4],sel[0],bout);

vedic4x4 u3 (aout,bout,product);

shifter u4 (product,shift,shift_out);

FA_generic  #(.N(16)) u5 (shift_out,product8x8_out,1'b0,sum,cout);

reg16 u6 (clk,sclr_n,clk_ena,sum,product8x8_out);

mult_control u7 (clk,reset_a,start,count,sel,shift,state_out,done_flag,clk_ena,sclr_n);

counter u8 (clk,(!start),count);
seven_segment_cntrl u9 (state_out,{seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g});

endmodule