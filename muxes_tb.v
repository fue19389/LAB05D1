//Universidad del Valle de Guatemala
//Gerardo Fuentes
//19389

module testbench();

  reg [1:0]d0;
  reg s;
  wire y;

  mux2 M1(d0, s, y);

  initial begin
  #1
    $display("\n");
    $display("Todas las ecuaciones");
    $display("s b c | y");
    $display("------|---");
    $monitor("%b %b %b | %b", s, d0[1], d0[0], y);
       s = 0; d0[1] = 0; d0[0] = 0;
    #1 s = 0; d0[1] = 0; d0[0] = 1;
    #1 s = 0; d0[1] = 1; d0[0] = 0;
    #1 s = 0; d0[1] = 1; d0[0] = 1;
    #1 s = 1; d0[1] = 0; d0[0] = 0;
    #1 s = 1; d0[1] = 0; d0[0] = 1;
    #1 s = 1; d0[1] = 1; d0[0] = 0;
    #1 s = 1; d0[1] = 1; d0[0] = 1;
  end

  initial
    #20 $finish;

  initial begin
    $dumpfile("muxes_tb.vcd");
    $dumpvars(0, testbench);
  end

endmodule
