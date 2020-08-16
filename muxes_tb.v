//Universidad del Valle de Guatemala
//Gerardo Fuentes
//19389

module testbench();

  reg [1:0]d0, d1;
  reg  t, u;
  wire [1:0]y2, y4;
  wire y3, y5;

//  mux2 M1();
  mux2_1 M2(d0, t, y2, y3);
  mux2_2 M3(d1, u, y4, y5);

  initial begin
  #1
    $display("\n");
    $display("Todas las ecuaciones");
    $display("t b c | y");
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
    $display("Todas las ecuaciones");
    $display("t b c | y");
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


  initial
    #40 $finish;

  initial begin
    $dumpfile("muxes_tb.vcd");
    $dumpvars(0, testbench);
  end

endmodule
