`timescale 1ns / 1ps
module test;

reg [0:127] key,data;
wire [0:127] endata;
reg [7:0] a;
reg [3:0] b;
wire c;

decryption m1(data,key,endata);

initial
begin
	$monitor("%h",endata);
	data=128'h21da46499463e3446a577f690d70f0ba;
	key=128'h6e696b68696c6e696b68696c6e696b68;
	#100;
end
endmodule
