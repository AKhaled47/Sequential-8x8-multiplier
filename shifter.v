module shifter(
    input [7:0] inp,
    input [1:0] cntrl,
    output reg [15:0] out 
);

always@(*) begin
case(cntrl)
2'b01: out={{4{1'b0}},inp,{4{1'b0}}};
2'b10: out={inp,{8{1'b0}}};
default: out={{8{1'b0}},inp};
endcase
end
endmodule