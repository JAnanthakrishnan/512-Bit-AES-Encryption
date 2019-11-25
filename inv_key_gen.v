module round_key11(key0,key1,key2,key3,key4,key5,key6,key7,key8,key9,key10);

input [0:127] key0;
output [0:127] key1,key2,key3,key4,key5,key6,key7,key8,key9,key10;

round_key r1(key0,32'h01000000,key1);
round_key r2(key1,32'h02000000,key2);
round_key r3(key2,32'h04000000,key3);
round_key r4(key3,32'h08000000,key4);
round_key r5(key4,32'h10000000,key5);
round_key r6(key5,32'h20000000,key6);
round_key r7(key6,32'h40000000,key7);
round_key r8(key7,32'h80000000,key8);
round_key r9(key8,32'h1b000000,key9);
round_key r10(key9,32'h36000000,key10);

endmodule

module round_key(temp_key,rcon,ko);

input [0:127] temp_key;
input [0:31] rcon;
output [0:127] ko;
wire [0:127] ko;

//shifting operation

wire [0:127] key,key2;
assign key[0:95]    = temp_key[0:95];
assign key[96:103]  = temp_key[104:111];
assign key[104:111] = temp_key[112:119];
assign key[112:119] = temp_key[120:127];
assign key[120:127] = temp_key[96:103];

//sub_bytes operation

sbox s1(key[96:99],key[100:103],key2[96:103]);
sbox s2(key[104:107],key[108:111],key2[104:111]);
sbox s3(key[112:115],key[116:119],key2[112:119]);
sbox s4(key[120:123],key[124:127],key2[120:127]);

//multiplication with rcon values
//xor with different columns
//ko is also numbered column wise

assign ko[0:31]  = key2[96:127]^key[0:31]^rcon[0:31]; 
assign ko[32:63]  = key2[96:127]^key[0:31]^key[32:63]^rcon[0:31]; 
assign ko[64:95]  = key2[96:127]^key[0:31]^key[32:63]^key[64:95]^rcon[0:31]; 
assign ko[96:127]  = key2[96:127]^key[0:31]^key[32:63]^key[64:95]^temp_key[96:127]^rcon[0:31]; 

endmodule
