//Universidad del Valle de Guatemala
//Gerardo Fuentes
//19389

module mux2(input [1:0]d0, input s, output y);

  assign y = s ? d0[1]:d0[0];

endmodule

module mux4(input [3:0]d1, input[1:]s1, output y1)

  mux2 m1();
  mux2 m2();
