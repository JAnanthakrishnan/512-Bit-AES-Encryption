module AES_decryption_512(enc_data,cipher_key,decrypted_data);

input [0:511]enc_data,cipher_key;
output reg [0:511]decrypted_data;
wire [0:127]de_data1,de_data2,de_data3,de_data4;
integer i=0,j=0;

aes128_decryption main1(enc_data[0:127],cipher_key[0:127],de_data1);
aes128_decryption main2(enc_data[128:255],cipher_key[128:255],de_data2);
aes128_decryption main3(enc_data[256:383],cipher_key[256:383],de_data3);
aes128_decryption main4(enc_data[384:511],cipher_key[384:511],de_data4);

always@(de_data1||de_data2||de_data3||de_data4)
begin
for(i=0;i<128;i=i+8)
begin
decrypted_data[j+:8]=de_data1[i+:8];
j=j+8;
decrypted_data[j+:8]=de_data2[i+:8];
j=j+8;
decrypted_data[j+:8]=de_data3[i+:8];
j=j+8;
decrypted_data[j+:8]=de_data4[i+:8];
j=j+8;
end
end
endmodule





