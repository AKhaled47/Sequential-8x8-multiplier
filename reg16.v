module reg16(
    input clk,sclr_n,clk_ena,
    input [15:0] inp,
    output reg [15:0] out
);

always@(posedge clk)
begin
    if(!sclr_n && clk_ena)
    out<=16'd0;
    else if(sclr_n && clk_ena)
    out<=inp;
    else
    out<=out;
end
endmodule
