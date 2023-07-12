module vedic4x4(
    input [3:0] a,b,
    output [7:0] s
);

wire [3:0] v_out [3:0];
wire [3:0] a_out [1:0];
wire [1:0] c;
wire final_carry;


vedic2x2 u1 (a[1:0],b[1:0],v_out[0]);
vedic2x2 u2 (a[1:0],b[3:2],v_out[1]);
vedic2x2 u3 (a[3:2],b[1:0],v_out[2]);
vedic2x2 u4 (a[3:2],b[3:2],v_out[3]);

FA_generic #(.N(4)) u5 ({2'b00,v_out[0][3:2]},v_out[1],1'b0,a_out[0],c[0]);

FA_generic #(.N(4)) u6 (a_out[0],v_out[2],1'b0,a_out[1],c[1]);

FA_generic #(.N(4)) u7 ({&c,^c,a_out[1][3:2]},v_out[3],1'b0,s[7:4],final_carry);

assign s[1:0]=v_out[0][1:0];

assign s[3:2]=a_out[1][1:0];

endmodule
