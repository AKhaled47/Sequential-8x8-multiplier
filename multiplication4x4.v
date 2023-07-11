module multiplication4x4(dataa,datab,product);

input [3:0] dataa,datab;
output [7:0] product;

wire [3:0] ab0,ab1,ab2,ab3;
wire [3:0] sum1,sum2,sum3;
wire [3:0] b0,b1,b2,b3;
wire cout1,cout2,cout3;

assign b0={4{datab[0]}};
assign b1={4{datab[1]}};
assign b2={4{datab[2]}};
assign b3={4{datab[3]}};


assign ab0=dataa&b0;
assign ab1=dataa&b1;
assign ab2=dataa&b2;
assign ab3=dataa&b3;

FA4 u1 ({1'b0,ab0[3:1]},ab1,sum1,cout1);
FA4 u2 (ab2,{cout1,sum1[3:1]},sum2,cout2);
FA4 u3 (ab3,{cout2,sum2[3:1]},sum3,cout3);

assign product[0]=ab0[0];
assign product[1]=sum1[0];
assign product[2]=sum2[0];
assign product[7:3]={cout3,sum3};
endmodule