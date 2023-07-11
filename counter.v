module counter(
    input clk,aclr_n,
    output reg [1:0] out
);

always@(posedge clk , negedge aclr_n)
begin
if(!aclr_n)
out<=2'd0;
else
out<=out+1;
end
endmodule