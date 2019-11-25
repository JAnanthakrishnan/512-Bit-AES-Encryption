module aes128_decryption(en_msg,cipher_key,de_msg);

output [0:127]de_msg;
input [0:127]en_msg,cipher_key;
wire [127:0]en_msg1,en_msg2,en_msg3,en_msg4,en_msg5,en_msg6,en_msg7,en_msg8,en_msg9,en_msg10,en_msg11;
wire [127:0]sr1,sr2,sr3,sr4,sr5,sr6,sr7,sr8,sr9,sr10;
wire [127:0]sb1,sb2,sb3,sb4,sb5,sb6,sb7,sb8,sb9,sb10;
wire [127:0]mc1,mc2,mc3,mc4,mc5,mc6,mc7,mc8,mc9;
wire [127:0]key0,key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11;

//code to generate 11th key
round_key11 r1(cipher_key,key1,key2,key3,key4,key5,key6,key7,key8,key9,key10);
assign en_msg1 = en_msg^key10;

/*round1*/

inv_shift_row a1(en_msg1,sr1);
inv_sub_byte a2(sr1,sb1);
assign en_msg2 = sb1^key9;
inv_mix_col a3(en_msg2,mc1);

/*round2*/

inv_shift_row a4(mc1,sr2);
inv_sub_byte a5(sr2,sb2);
assign en_msg3 = sb2^key8;
inv_mix_col a6(en_msg3,mc2);

/*round3*/

inv_shift_row a7(mc2,sr3);
inv_sub_byte a8(sr3,sb3);
assign en_msg4 = sb3^key7;
inv_mix_col a9(en_msg4,mc3);

/*round4*/

inv_shift_row a10(mc3,sr4);
inv_sub_byte a11(sr4,sb4);
assign en_msg5 = sb4^key6;
inv_mix_col a12(en_msg5,mc4);

/*round5*/

inv_shift_row a13(mc4,sr5);
inv_sub_byte a14(sr5,sb5);
assign en_msg6 = sb5^key5;
inv_mix_col a15(en_msg6,mc5);

/*round6*/

inv_shift_row a16(mc5,sr6);
inv_sub_byte a17(sr6,sb6);
assign en_msg7 = sb6^key4;
inv_mix_col a18(en_msg7,mc6);

/*round7*/

inv_shift_row a19(mc6,sr7);
inv_sub_byte a20(sr7,sb7);
assign en_msg8 = sb7^key3;
inv_mix_col a21(en_msg8,mc7);

/*round8*/

inv_shift_row a22(mc7,sr8);
inv_sub_byte a23(sr8,sb8);
assign en_msg9 = sb8^key2;
inv_mix_col a24(en_msg9,mc8);

/*round9*/

inv_shift_row a25(mc8,sr9);
inv_sub_byte a26(sr9,sb9);
assign en_msg10 = sb9^key1;
inv_mix_col a27(en_msg10,mc9);

/*round10*/

inv_shift_row a28(mc9,sr10);
inv_sub_byte a29(sr10,sb10);
assign de_msg = sb10^cipher_key;

endmodule


