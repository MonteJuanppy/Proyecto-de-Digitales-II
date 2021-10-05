`timescale 1ns/100ps
`include "clock_generator.v"
`include "yosys_clock_generator.v"

module clk_divider_tb; 
  
    wire clk_4f;
    wire clk_2f;
    wire clk_f;

    wire clk_4f_s;
    wire clk_2f_s;
    wire clk_f_s;

    reg clk_32f;

    clock_generator conductual(
        .clk_in (clk_32f),
        .clk_f (clk_f),
        .clk_2f (clk_2f),
        .clk_4f (clk_4f));

    yosys_clock_generator estructural(
        .clk_in (clk_32f),
        .clk_f (clk_f_s),
        .clk_2f (clk_2f_s),
        .clk_4f (clk_4f_s));
    
    //para el osciloscopio GTKWAVE
    initial
        begin
          $dumpfile("clk_gen.vcd");
          $dumpvars;
        end
    initial
        clk_32f = 0;
    always 
        #10 clk_32f = ~clk_32f; 
    initial
        begin
            #1000 $finish;
        end
endmodule