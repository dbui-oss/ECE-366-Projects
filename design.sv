module one_bit_full_adder(A, B, Cin, S, Cout);
  input A, B, Cin;
  output S, Cout;
  reg S, Cout;
  always @ (A or B or Cin)
  begin
    {Cout, S} = A + B + Cin;
  end 
  
endmodule


module one_bit_full_adder_structural(A, B, Cin, S, Cout);
  input A, B, Cin;
  output S, Cout;
  wire out0;
  wire out1;
  wire out2;
  wire out3;
  xor U1(out0, A, B);
  xor U2(S, out0, Cin);
  and U3(out1, A, Cin);
  and U4(out2, B, Cin);
  and U5(out3, A, B);
  or U6(Cout, out1, out2, out3);
  
endmodule

module four_bit_RCA(A, B, Cin, S, Cout);
  input [3:0] A, B;
  input Cin;
  output [3:0] S;
  output Cout;
  wire C1;
  wire C2;
  wire C3;
  one_bit_full_adder FA0(A[0], B[0], Cin, S[0], C1);
  one_bit_full_adder FA1(A[1], B[1], C1, S[1], C2);
  one_bit_full_adder FA2(A[2], B[2], C2, S[2], C3);
  one_bit_full_adder FA3(A[3], B[3], C3, S[3], Cout);
endmodule

module two_to_one_mux_for_RCS(Bout, B, Bnot, Cin);
  input B, Bnot, Cin;
  output Bout;
  wire T1;
  wire T2;
  wire Cin_not;
  and (T1, Bnot, Cin), (T2, B, Cin_not);
  not (Cin_not, Cin);
  or (Bout, T1, T2);
endmodule

module four_bit_RCS(A, B, Cin, S, Cout);
  input [3:0] A, B;
  input Cin;
  output [3:0] S;
  output Cout;
  wire C1;
  wire C2;
  wire C3;
  wire B0_not;
  wire B1_not;
  wire B2_not;
  wire B3_not;
  wire B0;
  wire B1;
  wire B2;
  wire B3;
  not(B0_not, B[0]);
  not(B1_not, B[1]);
  not(B2_not, B[2]);
  not(B3_not, B[3]);
  two_to_one_mux_for_RCS M0(B0, B[0], B0_not, Cin);
  two_to_one_mux_for_RCS M1(B1, B[1], B1_not, Cin);
  two_to_one_mux_for_RCS M2(B2, B[2], B2_not, Cin);
  two_to_one_mux_for_RCS M3(B3, B[3], B3_not, Cin);
  one_bit_full_adder FA0(A[0], B0, Cin, S[0], C1);
  one_bit_full_adder FA1(A[1], B1, C1, S[1], C2);
  one_bit_full_adder FA2(A[2], B2, C2, S[2], C3);
  one_bit_full_adder FA3(A[3], B3, C3, S[3], Cout);
endmodule

