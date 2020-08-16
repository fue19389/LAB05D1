//Universidad del Valle de Guatemala
//Gerardo Fuentes
//19389

//Modulo multiplexer 2:1 genérico
module mux2(input [1:0]d0, input s, output y);

  assign y = s ? d0[1]:d0[0];

endmodule

//Modulo multiplexer 4:1 a partir de un 2:1 genérico
//module mux4(input [3:0]d1, input[1:0]s1, output y1);

//  wire w1, w2;

//  mux2 m1([1:0]d1, [0]s1, w1);
//  mux2 m2([3:2]d1, [0]s1, w2);
//  mux2 m3(w2, w1, [1]s1, y1);

//endmodule

//Modulo multiplexer 8:1 a partir de modulos 4:1 y 2:1
//module mux8(input [7:0]d2, input[2:0]s2, output y2);

//  wire w3, w4;

//  mux4([3:0]d2, [1:0]s2, w3);
//  mux4([7:4]d2, [1:0]s2, w4);
//  mux2(w4, w3, [2]s2, y2);

//endmodule

//Modulo Tabla 1 con mux 2:1
module mux2_1(input [1:0]d0, input t, output [1:0]y2, output y3);

    assign y2[0]= (d0[1] ^ d0[0]);
    assign y2[1]= ~(d0[1] ^ d0[0]);
    mux2 M3(y2[1:0], t, y3);

endmodule

//Modulo Tabla 2 con mux 2:1
module mux2_2(input [1:0]d1, input u, output [1:0]y4, output y5);

  assign y4[0]= ~(d1[1] | d1[0]);
  assign y4[1]= ~(d1[1] & d1[0]);
  mux2 M4(y4[1:0], u, y5);

endmodule
