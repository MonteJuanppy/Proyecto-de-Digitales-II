// Fecha: 21-10-2021
// Modulo del receptor phy_rx
// Version 1.0
`include "phy_rx.v"
`include "phy_tx.v"
`include "clock_generator.v"


module phy (input [31:0] data_in,
    input valid_in,
    input clk_32f,
    output [31:0] data_out,
    output valid_out);

    //Cables para salidas de modulo de phy_tx
    wire phy_tx_out_0, phy_tx_out_1;

    phy_tx phy_tx(/*AUTOINST*/
		  // Outputs
		  .phy_tx_out_0		(phy_tx_out_0),
		  .phy_tx_out_1		(phy_tx_out_1),
		  // Inputs
		  .data_in		(data_in[31:0]),
		  .valid_in		(valid_in),
		  .clk_32f		(clk_32f));

    phy_rx phy_rx(/*AUTOINST*/
		  // Outputs
		  .data_out		(data_out[31:0]),
		  .valid_out		(valid_out),
		  // Inputs
		  .phy_tx_out_0		(phy_tx_out_0),
		  .phy_tx_out_1		(phy_tx_out_1),
		  .clk_32f		(clk_32f));

    endmodule
