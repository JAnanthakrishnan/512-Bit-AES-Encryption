module inv_mix_col(i_shift,i_mix);
input [0:127]i_shift;
output [0:127]i_mix;

assign i_mix[0:7] = multi(i_shift[0:7],8'h0e)^multi(i_shift[8:15],8'h0b)^multi(i_shift[16:23],8'h0d)^multi(i_shift[24:31],8'h09);
assign i_mix[8:15] = multi(i_shift[0:7],8'h09)^multi(i_shift[8:15],8'h0e)^multi(i_shift[16:23],8'h0b)^multi(i_shift[24:31],8'h0d);
assign i_mix[16:23] = multi(i_shift[0:7],8'h0d)^multi(i_shift[8:15],8'h09)^multi(i_shift[16:23],8'h0e)^multi(i_shift[24:31],8'h0b);
assign i_mix[24:31] = multi(i_shift[0:7],8'h0b)^multi(i_shift[8:15],8'h0d)^multi(i_shift[16:23],8'h09)^multi(i_shift[24:31],8'h0e);

assign i_mix[32:39] = multi(i_shift[32:39],8'h0e)^multi(i_shift[40:47],8'h0b)^multi(i_shift[48:55],8'h0d)^multi(i_shift[56:63],8'h09);
assign i_mix[40:47] = multi(i_shift[32:39],8'h09)^multi(i_shift[40:47],8'h0e)^multi(i_shift[48:55],8'h0b)^multi(i_shift[56:63],8'h0d);
assign i_mix[48:55] = multi(i_shift[32:39],8'h0d)^multi(i_shift[40:47],8'h09)^multi(i_shift[48:55],8'h0e)^multi(i_shift[56:63],8'h0b);
assign i_mix[56:63] = multi(i_shift[32:39],8'h0b)^multi(i_shift[40:47],8'h0d)^multi(i_shift[48:55],8'h09)^multi(i_shift[56:63],8'h0e);

assign i_mix[64:71] = multi(i_shift[64:71],8'h0e)^multi(i_shift[72:79],8'h0b)^multi(i_shift[80:87],8'h0d)^multi(i_shift[88:95],8'h09);
assign i_mix[72:79] = multi(i_shift[64:71],8'h09)^multi(i_shift[72:79],8'h0e)^multi(i_shift[80:87],8'h0b)^multi(i_shift[88:95],8'h0d);
assign i_mix[80:87] = multi(i_shift[64:71],8'h0d)^multi(i_shift[72:79],8'h09)^multi(i_shift[80:87],8'h0e)^multi(i_shift[88:95],8'h0b);
assign i_mix[88:95] = multi(i_shift[64:71],8'h0b)^multi(i_shift[72:79],8'h0d)^multi(i_shift[80:87],8'h09)^multi(i_shift[88:95],8'h0e);

assign i_mix[96:103] = multi(i_shift[96:103],8'h0e)^multi(i_shift[104:111],8'h0b)^multi(i_shift[112:119],8'h0d)^multi(i_shift[120:127],8'h09);
assign i_mix[104:111] = multi(i_shift[96:103],8'h09)^multi(i_shift[104:111],8'h0e)^multi(i_shift[112:119],8'h0b)^multi(i_shift[120:127],8'h0d);
assign i_mix[112:119] = multi(i_shift[96:103],8'h0d)^multi(i_shift[104:111],8'h09)^multi(i_shift[112:119],8'h0e)^multi(i_shift[120:127],8'h0b);
assign i_mix[120:127] = multi(i_shift[96:103],8'h0b)^multi(i_shift[104:111],8'h0d)^multi(i_shift[112:119],8'h09)^multi(i_shift[120:127],8'h0e);

function [7:0] multi;
input [7:0] mulltiplicand, multiplier;
begin
	multi = 0;
		while(multiplier!=0)
		begin
			if(multiplier[0])
				multi = mulltiplicand^multi;
			if(mulltiplicand[7])
				mulltiplicand = (mulltiplicand<<1)^8'h1b;
			else begin
				mulltiplicand = mulltiplicand<<1;
			end
			multiplier = multiplier>>1;
		end
end
endfunction
endmodule

