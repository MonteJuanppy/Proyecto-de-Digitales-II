//Autor: Juan Ignacio Montealegre Salazar
//Fecha: 28-09-2021
//Version 1.3

`timescale 	1ns	/ 100ps
// escala	unidad temporal (valor de "#1") / precisión

// includes de archivos de verilog
`include "conv_32_8.v"
`include "conv_8_32.v"
`include "Probador_32_8.v"

module BancoPruebas; // Testbench
	// Por lo general, las señales en el banco de pruebas son wires.
	// No almacenan un valor, son manejadas por otras instancias de módulos.

	wire clk;
    wire [31:0] entrada_32_bits;
    wire [7:0] senal_8bits;
    wire [31:0] salida_32_bits;

	// Se instancia el módulo del multiplexor conductual
	conv_32_8 conductual(.clk(clk), .dataIn(entrada_32_bits), .dataOut(senal_8bits));

	// Se instancia el módulo del multiplexor estructural
	conv_8_32 estructural(.clk(clk), .dataIn(senal_8bits), .dataOut(salida_32_bits));

	// Probador: generador de señales y monitor
	Probador2 prob(.clk(clk), .dataIn(senal_32bits), .dataOut(senal_8bits));

endmodule

