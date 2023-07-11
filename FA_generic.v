module FA_generic
    #(parameter N = 16)
(
input wire [N-1:0] a,b,
input wire cin,
output wire [N-1:0] s,
output wire cout
);
wire [N-2:0] in_cin;
FA fa1 (a[0],b[0],cin,s[0],in_cin[0]);
genvar i;
generate
    for(i=1;i<N-1;i=i+1)begin
      FA fa0  (a[i],b[i],in_cin[i-1],s[i],in_cin[i]);
    end
endgenerate
FA fa_end (a[N-1],b[N-1],in_cin[N-2],s[N-1],cout);

endmodule