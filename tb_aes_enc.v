module tb_aes_enc;

reg [511:0]data,cipher_key,enc;
wire [511:0]enc_data,dec_data;
AES_encryption_512 aes1(data,cipher_key,enc_data);
AES_decryption_512 aes2(enc,cipher_key,dec_data);
initial
begin
$monitor("%h\n%s",enc_data,dec_data);
data="we atlast finished..lets wrap up";
cipher_key="that's a very good sign";
enc = 512'h9594b7201c4b6a037d99f31d664fa4cd84702f0a16f0772f96398a77e63ec40cc2be5193a0e31b66b78168efaed8b1e33e234206fc098718ab62ac32ddfbcd93;
end
endmodule
