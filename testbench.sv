// Code your testbench here
// or browse Examples
module four_bit_RCS_RCA_tb;
  reg [3:0] A, B;
  reg Cin;
  wire [3:0] S;
  wire Cout;
  four_bit_RCS U0(A, B, Cin, S, Cout);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, four_bit_RCS_RCA_tb);
    A = 4'b0011;
    B = 4'b0100;
    Cin = 0;
    #10;
    
    A = 4'b0111;
    B = 4'b0011;
    Cin = 1;
    #10;
    
    A = 4'b1101;
    B = 4'b0010;
    Cin = 0;
    #10;
    
    A = 4'b1111;
    B = 4'b1110;
    Cin = 1;
    #10;
    
    A = 4'b1111;
    B = 4'b0001;
    Cin = 0;
    #10;
    
    $finish;
  end
endmodule

module CLA_tb;
  reg [31:0] A, B;
  reg Cin;
  wire [31:0] S;
  wire Cout;
  CLA U0(A, B, Cin, S, Cout);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, CLA_tb);
    A = 32'b00000000000000000000000000000011;
    B = 32'b00000000000000000000000000000100;
    Cin = 0;
    #10;

    A = 32'b00000000000000000000000000000111;
    B = 32'b00000000000000000000000000000011;
    Cin = 1;
    #10;

    A = 32'b00000000000000000000000000001101;
    B = 32'b00000000000000000000000000000010;
    Cin = 0;
    #10;

    A = 32'b11111111111111111111111111111111;
    B = 32'b00000000000000000000000000000001;
    Cin = 0;
    #10;

    A = 32'b00000000000000001111111111111111;
    B = 32'b00000000000000000000000000000001;
    Cin = 0;
    #10;

    A = 32'b11111111111111111111111111111111;
    B = 32'b11111111111111111111111111111110;
    Cin = 1;
    #10;

    $finish;
  end
endmodule

module PPA_tb;
  reg [15:0] A, B;
  reg Cin;
  wire [15:0] S;
  wire Cout;
  PPA U0(A, B, Cin, S, Cout);
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, PPA_tb);
    A = 16'b0000000000000011;
    B = 16'b0000000000000100;
    Cin = 0;
    #10;

    A = 16'b0000000000001101;
    B = 16'b0000000000000010;
    Cin = 0;
    #10;

    A = 16'b1111111111111111;
    B = 16'b0000000000000001;
    Cin = 0;
    #10;

    A = 16'b0000000000000111;
    B = 16'b0000000000000011;
    Cin = 1;
    #10;

    A = 16'b0000000011111111;
    B = 16'b0000000000000001;
    Cin = 0;
    #10;

    A = 16'b1111111111111111;
    B = 16'b1111111111111110;
    Cin = 1;
    #10;

    $finish;
  end
endmodule