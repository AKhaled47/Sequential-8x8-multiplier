module vedic2x2(
    input [1:0] a,b,
    output [3:0] s
);
 
wire [1:0] cout; 
assign s[0]=a[0] & b[0];

FA u1 (a[1]&b[0],a[0]&b[1],1'b0,s[1],cout[0]);
FA u2 (cout[0],a[1]&b[1],1'b0,s[2],cout[1]);

assign s[3]=cout[1];
endmodule