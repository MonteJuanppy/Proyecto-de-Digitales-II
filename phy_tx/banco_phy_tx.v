//Fecha: 21-10-2021
//Version 1.0

`timescale 	1ns	/ 100ps
// escala	unidad temporal (valor de "#1") / precisión

// includes de archivos de verilog
`include "phy_tx.v"
`include "probador_phy_tx.v"

module banco_phy_tx; // Testbench

    //Inputs
    wire clk_32f, valid_0;
    wire [31:0] data_in;

    //Outputs
	wire valid_out;
    wire phy_tx_out_0;
    wire phy_tx_out_1;

	// Se instancia el módulo del convertidor 32 a 8 bits conductual
	phy_tx phy_tx(/*AUTOINST*/
		      // Outputs
		      .phy_tx_out_0	(phy_tx_out_0),
		      .phy_tx_out_1	(phy_tx_out_1),
		      // Inputs
		      .data_in		(data_in[31:0]),
		      .valid_in		(valid_in),
		      .clk_32f		(clk_32f));

	// Probador: generador de señales y monitor
	probador_phy_tx probador_phy_tx(/*AUTOINST*/
					// Outputs
					.clk_32f		(clk_32f),
					.data_in	(data_in[31:0]),
					.valid_in	(valid_in),
					// Inputs
					.phy_tx_out_0	(phy_tx_out_0),
					.phy_tx_out_1	(phy_tx_out_1));

endmodule
