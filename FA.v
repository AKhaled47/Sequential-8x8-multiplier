module FA (
input wire a,b,cin,
output wire s,cout
);
assign s=(a^b)^cin;
assign cout=(a&b)|(cin & (a^b));
endmodule