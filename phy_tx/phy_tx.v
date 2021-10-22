// Fecha: 21-10-2021
// Modulo del transmisor phy_tx
// Version 1.0
`include "clock_generator.v"
`include "byte_striping.v"
`include "conv_32_8.v"
`include "paralelo_serial.v"


module phy_tx (input [31:0] data_in,
    input valid_in,
    input clk_32f,
    output phy_tx_out_0,
    output phy_tx_out_1);

    //Cables para salidas de modulo de clock_generator
    wire clk_2f, clk_4f, clk_32f;

    //Cables para salidas de modulo de byte_striping
    wire valid_0, valid_1;
    wire [31:0] lane_0;
    wire [31:0] lane_1;

    //Cables para salidas de modulos de conv_32_8
    wire [7:0] conv_32_8_out_0;
    wire conv_32_8_valid_0, conv_32_8_valid_1;
    wire [7:0] conv_32_8_out_1;

    clock_generator clock_generator(/*AUTOINST*/
				    // Outputs
				    .clk_f		(clk_f),
				    .clk_2f		(clk_2f),
				    .clk_4f		(clk_4f),
				    // Inputs
				    .clk_32f		(clk_32f));

    byte_striping byte_striping(/*AUTOINST*/
				// Outputs
				.lane_0		(lane_0[31:0]),
				.lane_1		(lane_1[31:0]),
				.valid_0	(valid_0),
				.valid_1	(valid_1),
				// Inputs
				.clk_2f		(clk_2f),
				.data_in	(data_in[31:0]),
				.valid_in	(valid_in));

    conv_32_8 conv_0(/*AUTOINST*/
		     // Outputs
		     .data_out		(conv_32_8_out_0),
		     .valid_out		(conv_32_8_valid_0),
		     // Inputs
		     .clk_4f		(clk_4f),
		     .valid_in		(valid_0),
		     .data_in		(lane_0));

    conv_32_8 conv_1(/*AUTOINST*/
		     // Outputs
		     .data_out		(conv_32_8_out_1),
		     .valid_out		(conv_32_8_valid_1),
		     // Inputs
		     .clk_4f		(clk_4f),
		     .valid_in		(valid_1),
		     .data_in		(lane_1));

    paralelo_serial sign_0(/*AUTOINST*/
			   // Outputs
			   .data_out		(phy_tx_out_0),
			   // Inputs
			   .clk_4f		(clk_4f),
			   .clk_32f		(clk_32f),
			   .valid_in		(conv_32_8_valid_0),
			   .data_in		(conv_32_8_out_0));

    paralelo_serial sign_1(/*AUTOINST*/
			   // Outputs
			   .data_out		(phy_tx_out_1),
			   // Inputs
			   .clk_4f		(clk_4f),
			   .clk_32f		(clk_32f),
			   .valid_in		(conv_32_8_valid_1),
			   .data_in		(conv_32_8_out_1));

    endmodule
