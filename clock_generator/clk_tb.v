`timescale 1ns/100ps
`include "clk_4f.v"
`include "clk_2f.v"
`include "clk_f.v"

module clk_divider_tb;
    wire clk_4;
    wire clk_2;
    wire clk_1;
    reg clk_in;

    clk_4f clk4(
        .clk_in (clk_in),
        .clk_4  (clk_4));
    clk_2f clk2(
        .clk_in (clk_in),
        .clk_2  (clk_2));
    clk_1f clk1(
        .clk_in (clk_in),
        .clk_1  (clk_1));
    //para el osciloscopio GTKWAVE

    initial
        begin
          $dumpfile("clk_gen.vcd");
          $dumpvars;
        end
    initial
        clk_in = 0;
    always 
        #10 clk_in = ~clk_in; 
    initial
        begin
            #700 $finish;
        end
endmodule