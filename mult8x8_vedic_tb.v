module mult8x8_vedic_tb;

    reg [7:0] dataa,datab;
    reg start,clk,reset_a;
    wire [15:0] product8x8_out;
    wire done_flag;
    wire seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g;

    mult8x8_vedic u1 (dataa,datab,start,clk,reset_a,product8x8_out,done_flag,seg_a,seg_b,seg_c,seg_d,seg_e,seg_f,seg_g);

    initial begin
        reset_a=1'b0;
        clk=1'b0;
        dataa=8'd11;
        datab=8'd85;
        start=1'b0;
        #10 reset_a=1'b0;
        #10 reset_a=1'b1;
        start=1'b1;
        #10 start=1'b0;
    end

    always begin
        #5 clk=~clk;
    end

    endmodule