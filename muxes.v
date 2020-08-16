//Universidad del Valle de Guatemala
//Gerardo Fuentes
//19389

//Modulo multiplexer 2:1 genérico
module mux2(input [1:0]d0, input s, output y0);

  assign y0 = s ? d0[1]:d0[0];

endmodule

//Modulo multiplexer 4:1 a partir de un 2:1 genérico
module mux4(input [3:0]d1, input[1:0]s1, output[1:0]y11, output y1);

  mux2 m1(d1[1:0], s1[0], y11[0]);
  mux2 m2(d1[3:2], s1[0], y11[1]);
  mux2 m3(y11[1:0], s1[1], y1);

endmodule

//Modulo multiplexer 8:1 a partir de modulos 4:1 y 2:1
module mux8(input [7:0]d2, input[2:0]s2, output[1:0]y22, y23, y24, output y2);

  mux4([3:0]d2, s2[1:0], y23[1:0], y22[0]);
  mux4([7:4]d2, s2[1:0], y24[1:0], y22[1]);
  mux2(y22[1:0], [2]s2, y2);

//endmodule

//Modulo Tabla 1 con mux 2:1
module mux2_1(input [1:0]d0, input t, output [1:0]y2, output y3);

    assign y2[0]= (d0[1] ^ d0[0]);
    assign y2[1]= ~(d0[1] ^ d0[0]);
    mux2 M3(y2[1:0], t, y3);

endmodule

//Modulo Tabla 2 con mux 2:1
module mux2_2(input [1:0]d0, input t, output [1:0]y2, output y3);

  assign y2[0]= ~(d0[1] | d0[0]);
  assign y2[1]= ~(d0[1] & d0[0]);
  mux2 M4(y2[1:0], t, y3);

endmodule

//Modulo Tabla 1 con mux 4:1
module mux4_1(input[2:0]d1, output[1:0]y4_2, output[3:0]y4_1, output y5);

  assign y4_1[0]= d1[0];
  assign y4_1[1]= ~d1[0];
  assign y4_1[2]= ~d1[0];
  assign y4_1[3]= d1[0];
  mux4 M5(y4_1[3:0], d1[2:1], y4_2[1:0], y5);

endmodule

//Modulo Tabla 2 con mux 4:1
module mux4_2(input[2:0]d1, output[1:0]y4_2, output[3:0]y4_1, output y5);

  assign y4_1[0]= ~d1[0];
  assign y4_1[1]= 0;
  assign y4_1[2]= 1;
  assign y4_1[3]= ~d1[0];
  mux4 M5(y4_1[3:0], d1[2:1], y4_2[1:0], y5);

endmodule

//Modulo Tabla 1 con mux 8:1
module mux8_1(input [7:0]d2, input[2:0]s2, output[1:0]y22, y23, y24, output y2);
