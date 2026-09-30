// Code your testbench here
// or browse Examples
module four_bit_RCS_RCA_tb;
  reg [3:0] A, B;
  reg Cin;
  wire [3:0] S;
  wire Cout;
  four_bit_RCS U0(A, B, Cin, S, Cout);
  initial begin
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
