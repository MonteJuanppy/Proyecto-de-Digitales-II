//Fecha: 04-10-2021
//Version 1.0

`timescale 	1ns	/ 100ps
// escala	unidad temporal (valor de "#1") / precisión

// includes de archivos de verilog
`include "conv_32_8.v"
`include "yosys_conv_32_8.v"
`include "Probador_32_8.v"

module BancoPruebas; // Testbench
	// Por lo general, las señales en el banco de pruebas son wires.
	// No almacenan un valor, son manejadas por otras instancias de módulos.

	wire clk, clk4f, valid_0, valid_out;
    wire [31:0] data_in;
    wire [7:0] data_out;

	// Se instancia el módulo del convertidor 32 a 8 bits conductual
	conv_32_8 conductual(.clk(clk4f), .valid_0(valid_0), .data_in(data_in), .data_out(data_out), .valid_out(valid_out));

	// Se instancia el módulo del convertidor 32 a 8 bits estructural
	yosys_conv_32_8 estructural(.clk(clk4f), .valid_0(valid_0), .data_in(data_in), .data_out(data_out), .valid_out(valid_out));

	// Probador: generador de señales y monitor
	Probador_32_8 prob(.clk(clk), .clk4f(clk4f), .valid_0(valid_0), .entrada(data_in), .salida(data_out), .valid_out(valid_out));

endmodule

