`timescale 1ns/100ps
`include "clock_generator.v"
`include "yosys_clock_generator.v"

module clk_divider_tb; 
    wire clk_4;
    wire clk_2;
    wire clk_1;
    wire clk_4_s;
    wire clk_2_s;
    wire clk_1_s;
    reg clk_in;

    clock_generator conductual(
        .clk_in (clk_in),
        .clk_1 (clk_1),
        .clk_2 (clk_2),
        .clk_4 (clk_4));

    yosys_clock_generator estructural(
        .clk_in (clk_in),
        .clk_1 (clk_1_s),
        .clk_2 (clk_2_s),
        .clk_4 (clk_4_s));
    
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