//Fecha: 21-10-2021
//Version 1.0

`timescale 	1ns	/ 100ps
// escala	unidad temporal (valor de "#1") / precisión

// includes de archivos de verilog
`include "phy.v"
//`include "yosys_phy.v"
`include "probador_phy.v"

module banco_phy_tx; // Testbench

    //Inputs
    wire clk_32f, valid_in;
    wire [31:0] data_in;

    //Outputs
	wire valid_out;
    wire [31:0] data_out;

	// Se instancian los modulos


	phy conductual(/*AUTOINST*/
		       // Outputs
		       .data_out	(data_out[31:0]),
		       .valid_out	(valid_out),
		       // Inputs
		       .data_in		(data_in[31:0]),
		       .valid_in	(valid_in),
		       .clk_32f		(clk_32f));


	/*yosys_phy estructural();*/


	// Probador: generador de señales y monitor
	probador_phy probador_phy(/*AUTOINST*/
				  // Outputs
				  .clk_32f		(clk_32f),
				  .data_in		(data_in[31:0]),
				  .valid_in		(valid_in),
				  // Inputs
				  .data_out		(data_out),
				  .valid_out		(valid_out));

endmodule
