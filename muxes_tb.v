//Universidad del Valle de Guatemala
//Gerardo Fuentes
//19389

module testbench();

  reg [2:0]d2, d3, d4, d6;
  reg [1:0]d0, d1;
  reg  t, u;
  wire [7:0]d100, d200;
  wire [3:0]y100, y200;
  wire [1:0]y2, y4, y6, y8, y10, y12, y14, y16, y18, y20;
  wire y3, y5, y7, y9, y11, y13;


  mux2_1 M2(d0, t, y2, y3);
  mux2_2 M3(d1, u, y4, y5);
  mux4_1 M4(d2, y6, y100, y7);
  mux4_2 M5(d3, y8, y200, y9);
  mux8_1 M6(d100, d4, y10, y12, y14, y11);
  mux8_2 M7(d200, d6, y16, y18, y20, y13);

  initial begin
  #1
    $display("\n");
    $display("TABLA NO1 MUX 2:1");
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", t, d0[1], d0[0], y3);
       t = 0; d0[1] = 0; d0[0] = 0;
    #1 t = 0; d0[1] = 0; d0[0] = 1;
    #1 t = 0; d0[1] = 1; d0[0] = 0;
    #1 t = 0; d0[1] = 1; d0[0] = 1;
    #1 t = 1; d0[1] = 0; d0[0] = 0;
    #1 t = 1; d0[1] = 0; d0[0] = 1;
    #1 t = 1; d0[1] = 1; d0[0] = 0;
    #1 t = 1; d0[1] = 1; d0[0] = 1;
  end

  initial begin
  #9
    $display("\n");
    $display("TABLA NO2 MUX 2:1");
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", u, d1[1], d1[0], y5);
       u = 0; d1[1] = 0; d1[0] = 0;
    #1 u = 0; d1[1] = 0; d1[0] = 1;
    #1 u = 0; d1[1] = 1; d1[0] = 0;
    #1 u = 0; d1[1] = 1; d1[0] = 1;
    #1 u = 1; d1[1] = 0; d1[0] = 0;
    #1 u = 1; d1[1] = 0; d1[0] = 1;
    #1 u = 1; d1[1] = 1; d1[0] = 0;
    #1 u = 1; d1[1] = 1; d1[0] = 1;
  end

  initial begin
  #18
    $display("\n");
    $display("TABLA NO1 MUX 4:1");
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", d2[2], d2[1], d2[0], y7);
       d2[2] = 0; d2[1] = 0; d2[0] = 0;
    #1 d2[2] = 0; d2[1] = 0; d2[0] = 1;
    #1 d2[2] = 0; d2[1] = 1; d2[0] = 0;
    #1 d2[2] = 0; d2[1] = 1; d2[0] = 1;
    #1 d2[2] = 1; d2[1] = 0; d2[0] = 0;
    #1 d2[2] = 1; d2[1] = 0; d2[0] = 1;
    #1 d2[2] = 1; d2[1] = 1; d2[0] = 0;
    #1 d2[2] = 1; d2[1] = 1; d2[0] = 1;
  end

  initial begin
  #28
    $display("\n");
    $display("TABLA NO2 MUX 4:1");
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", d3[2], d3[1], d3[0], y9);
       d3[2] = 0; d3[1] = 0; d3[0] = 0;
    #1 d3[2] = 0; d3[1] = 0; d3[0] = 1;
    #1 d3[2] = 0; d3[1] = 1; d3[0] = 0;
    #1 d3[2] = 0; d3[1] = 1; d3[0] = 1;
    #1 d3[2] = 1; d3[1] = 0; d3[0] = 0;
    #1 d3[2] = 1; d3[1] = 0; d3[0] = 1;
    #1 d3[2] = 1; d3[1] = 1; d3[0] = 0;
    #1 d3[2] = 1; d3[1] = 1; d3[0] = 1;
  end

  initial begin
  #40
    $display("\n");
    $display("TABLA NO1 MUX 8:1");
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", d4[2], d4[1], d4[0], y11);
       d4[2] = 0; d4[1] = 0; d4[0] = 0;
    #1 d4[2] = 0; d4[1] = 0; d4[0] = 1;
    #1 d4[2] = 0; d4[1] = 1; d4[0] = 0;
    #1 d4[2] = 0; d4[1] = 1; d4[0] = 1;
    #1 d4[2] = 1; d4[1] = 0; d4[0] = 0;
    #1 d4[2] = 1; d4[1] = 0; d4[0] = 1;
    #1 d4[2] = 1; d4[1] = 1; d4[0] = 0;
    #1 d4[2] = 1; d4[1] = 1; d4[0] = 1;
  end

  initial begin
  #55
    $display("\n");
    $display("TABLA NO2 MUX 8:1");
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", d6[2], d6[1], d6[0], y13);
       d6[2] = 0; d6[1] = 0; d6[0] = 0;
    #1 d6[2] = 0; d6[1] = 0; d6[0] = 1;
    #1 d6[2] = 0; d6[1] = 1; d6[0] = 0;
    #1 d6[2] = 0; d6[1] = 1; d6[0] = 1;
    #1 d6[2] = 1; d6[1] = 0; d6[0] = 0;
    #1 d6[2] = 1; d6[1] = 0; d6[0] = 1;
    #1 d6[2] = 1; d6[1] = 1; d6[0] = 0;
    #1 d6[2] = 1; d6[1] = 1; d6[0] = 1;
  end

  initial
    #120 $finish;

  initial begin
    $dumpfile("muxes_tb.vcd");
    $dumpvars(0, testbench);
  end

endmodule
