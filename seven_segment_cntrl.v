module seven_segment_cntrl(
    input [2:0] inp,
    output reg [6:0] out
);

always@(*)
begin
case(inp)
3'b000: out=7'b1111110;
3'b001: out=7'b0110000;
3'b010: out=7'b1101101;
3'b011: out=7'b1111001;
default: out=7'b1001111;

endcase
end
endmodule