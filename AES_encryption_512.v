module AES_encryption_512(data,cipher_key,encrypted_data);

input [0:511]data,cipher_key;
output [0:511]encrypted_data;
reg [0:127]data1,data2,data3,data4;
wire [0:127]en_key1,en_key2,en_key3,en_key4;
integer i,k1=0;

always@(data)
begin
for(i=0;i<128;i=i+8)
begin
	data1[i+:8]=data[k1+:8];
	k1=k1+8;
	data2[i+:8]=data[k1+:8];
	k1=k1+8;
	data3[i+:8]=data[k1+:8];
	k1=k1+8;
	data4[i+:8]=data[k1+:8];
	k1=k1+8;
end
end
aes128_encryption aes128_encryption1(data1,cipher_key[0:127],en_key1);
aes128_encryption aes128_encryption2(data2,cipher_key[128:255],en_key2);
aes128_encryption aes128_encryption3(data3,cipher_key[256:383],en_key3);
aes128_encryption aes128_encryption4(data4,cipher_key[384:511],en_key4);

assign encrypted_data = {en_key1,en_key2,en_key3,en_key4};
endmodule

	
	
	

