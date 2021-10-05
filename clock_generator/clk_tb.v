`timescale 1ns/100ps
`include "clk_4f.v"
`include "clk_2f.v"
`include "clk_f.v"
`include "synth_4f.v"
`include "synth_2f.v"
`include "synth_1f.v"
module clk_divider_tb; 
    wire clk_4;
    wire clk_2;
    wire clk_1;
    wire clk_4_s;
    wire clk_2_s;
    wire clk_1_s;
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
    //Yosys
    clk_4f_ys clk_4fys(
        .clk_in (clk_in),
        .clk_4  (clk_4_s));
    clk_2f_ys clk_2fys(
        .clk_in (clk_in),
        .clk_2  (clk_2_s));
    clk_1f_ys clk_1fys(
        .clk_in (clk_in),
        .clk_1  (clk_1_s));
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
            #1000 $finish;
        end
endmodule