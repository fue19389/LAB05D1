//Universidad del Valle de Guatemala
//Gerardo Fuentes
//19389

//Modulo multiplexer 2:1 genérico
module mux2(input [1:0]d0, input s, output y0);//inputs usando bus

  assign y0 = s ? d0[1]:d0[0];//función genérica del mux2:1

endmodule

//Modulo Tabla 1 con mux 2:1
module mux2_1(input [1:0]i0, input j, output [1:0]k11, output k1);

    assign k11[0]= (i0[1] ^ i0[0]);// entrada del mux
    assign k11[1]= ~(i0[1] ^ i0[0]);// entrada del mux
    mux2 M3(k11[1:0], j, k1);//función booleana específica implementando el mux 2:1

endmodule

//Modulo Tabla 2 con mux 2:1
module mux2_2(input [1:0]i0, input j, output [1:0]k22, output k2);

  assign k22[0]= ~(i0[1] | i0[0]);// entrada del mux
  assign k22[1]= ~(i0[1] & i0[0]);// entrada del mux
  mux2 M4(k22[1:0], j, k2);//función booleana específica implementando el mux 2:1

endmodule






//Modulo multiplexer 4:1 a partir de muxes 2:1 genérico
module mux4(input [3:0]d1, input[1:0]s1, output[1:0]y11, output y1);// Es importante aclarar que se agregó un output de 2 bits, y cada bit será una entrada en el mux final,
//ya que definimos que las entradas del mux 2:1 deben usar un bus, de lo contrario señala error (si usamos inputs independientes)

  mux2 m1(d1[1:0], s1[0], y11[0]);//mux 2:1 que tendrá como salida la entrada con el bit menos significativo del bus final
  mux2 m2(d1[3:2], s1[0], y11[1]);//mux 2: que tendrá como salida la entrada con el bit más significativo del bus final
  mux2 m3(y11[1:0], s1[1], y1);//mux 2:1 que contiene al bus final

endmodule

//Modulo Tabla 1 con mux 4:1
module mux4_1(input[2:0]n1, output[1:0]l111, output[3:0]l11, output l1);//se usó un bus de 3 bits ya que
//las salidas del mux 4:1 para una tabla de verdad de 2n entradas estará en términos de c,
//y nos quedan dos bits que se usarán como los "enable"(creo que es eso), pero permite el paso de una señal
//se conecta entonces c a las 4 entradas del splitter del mux 4:1

  assign l11[0]= n1[0];
  assign l11[1]= ~n1[0];
  assign l11[2]= ~n1[0];
  assign l11[3]= n1[0];// todo esto es la conexión de c a las 4 entradas
  mux4 M5(l11[3:0], n1[2:1], l111[1:0], l1);//aquí tenemos la nueva entrada de 4 bit resultante de la dependencia de c, implementada en el mux 4:1

endmodule

//Modulo Tabla 2 con mux 4:1
module mux4_2(input[2:0]n1, output[1:0]l222, output[3:0]l22, output l2);// se realizó el mismo proceso que en el anterior ya que es el mismo principio
//solo cambia la lógica combinacional abajo descrita

  assign l22[0]= ~n1[0];
  assign l22[1]= 0;
  assign l22[2]= 1;
  assign l22[3]= ~n1[0];// si, justo aquí
  mux4 M5(l22[3:0], n1[2:1], l222[1:0], l2);// esta es de nuevo, la implementacion directa del mux 4:1 con sus 4 entradas definidas

endmodule






//Modulo multiplexer 8:1 a partir de modulos 4:1 y 2:1
module mux8(input [7:0]d2, input[2:0]s2, output[1:0]y22, y23, y24, output y2);// Para este módulo se utilizó un input de 8 bits, un solo input de 3 bits, usando el
//mas significativo para definir el enable del mux final y los dos bits restantes para implementarlo en ambos mux de 4:1 , además se utilizaron outputs de 2 bits de nuevo para la
//salida de cada mux 4:1 que llegará a su respectivo mux interno de 2:1, aclarando de nuevo que es porque el las entradas de los mux de 2:1 están definidas por buses de 2 bits

  mux4 m4(d2[3:0], s2[1:0], y23[1:0], y22[0]);
  mux4 m5(d2[7:4], s2[1:0], y24[1:0], y22[1]);
  mux2 m6(y22[1:0], s2[2], y2);

endmodule

//Modulo Tabla 1 con mux 8:1
module mux8_1(output [7:0]v2, input[2:0]o2, output[1:0]p11, p12, p13, output p1);//Nótese, que ahora ya no tenemos inputs, para las entradas, sino unicamente para los enables
//esto es porque las entradas serán valores fijos, entonces el valor fijo es el input, por lo que no se usará un reg que cambiaría su valor, sino un wire (en el testbench)
//entonces solo necesitamos que ingrese el circuito, con dichos valores, y se define por lo tanto como output.

  assign v2[0]= 0;
  assign v2[1]= 1;
  assign v2[2]= 1;
  assign v2[3]= 0;
  assign v2[4]= 1;
  assign v2[5]= 0;
  assign v2[6]= 0;
  assign v2[7]= 1;
  mux8 M6(v2[7:0], o2[2:0], p11[1:0], p12[1:0], p13[1:0], p1);

endmodule

//Modulo Tabla 2 con mux 8:1
module mux8_2(output [7:0]q2, input[2:0]o2, output[1:0]p21, p22, p23, output p2);

  assign q2[0]= 1;
  assign q2[1]= 0;
  assign q2[2]= 0;
  assign q2[3]= 0;
  assign q2[4]= 1;
  assign q2[5]= 1;
  assign q2[6]= 1;
  assign q2[7]= 0;
  mux8 M7(q2[7:0], o2[2:0], p21[1:0], p22[1:0], p23[1:0], p2);

endmodule
