module FA4 (a,b,sum,cout);
input [3:0] a,b;
output [3:0] sum;
output cout;

FA_generic #(.N(4)) fa4 (a,b,1'b0,sum,cout);
endmodule



