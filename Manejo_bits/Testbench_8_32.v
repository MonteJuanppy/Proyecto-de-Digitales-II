//Fecha: 04-10-2021
//Version 1.0

`timescale 	1ns	/ 100ps
// escala	unidad temporal (valor de "#1") / precisión

// includes de archivos de verilog
`include "conv_8_32.v"
`include "Probador_8_32.v"

module BancoPruebas; // Testbench
	// Por lo general, las señales en el banco de pruebas son wires.
	// No almacenan un valor, son manejadas por otras instancias de módulos.

	wire clk, clk4f, valid_0, valid_out;
    wire [7:0] data_in;
    wire [31:0] data_out;

	// Se instancia el módulo del convertidor 32 a 8 bits conductual
	conv_8_32 conductual(.clk(clk4f), .valid_0(valid_0), .data_in(data_in), .data_out(data_out), .valid_out(valid_out));

	// Probador: generador de señales y monitor
	Probador_8_32 prob(.clk(clk), .clk4f(clk4f), .valid_0(valid_0), .entrada(data_in), .salida(data_out), .valid_out(valid_out));

endmodule

