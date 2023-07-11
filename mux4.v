module mux4(
    input [3:0] a,b,
    input sel,
    output reg [3:0] out
);

always @(*) begin
    if(!sel)
    out=a;
    else
    out=b;
end
endmodule