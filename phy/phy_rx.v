// Fecha: 21-10-2021
// Modulo del receptor phy_rx
// Version 1.0

`include "byte_unstriping.v"
`include "conv_8_32.v"
`include "serial_paralelo.v"


module phy_rx (input phy_tx_out_0,
    input phy_tx_out_1,
    input clk_32f,
    output [31:0] data_out,
    output valid_out);

    //Cables para salidas de modulo de clock_generator
    wire clk_2f, clk_4f, clk_32f;

    //Cables para salidas de modulos de serial_paralelo
    wire valid_0, valid_1;
    wire [7:0] paralelo_0;
    wire [7:0] paralelo_1;

    //Cables para salidas de modulos de conv_8_32
    wire conv_8_32_valid_0, conv_8_32_valid_1;
    wire [31:0] lane_0;
    wire [31:0] lane_1;

    clock_generator clock_generator(/*AUTOINST*/
				    // Outputs
				    .clk_f		(clk_f),
				    .clk_2f		(clk_2f),
				    .clk_4f		(clk_4f),
				    // Inputs
				    .clk_32f		(clk_32f));

    serial_paralelo sign_0(/*AUTOINST*/
			   // Outputs
			   .data_out		(paralelo_0),
			   .valid_out		(valid_0),
			   // Inputs
			   .data_in		(phy_tx_out_0),
			   .clk_32f		(clk_32f),
			   .clk_4f		(clk_4f));

    serial_paralelo sign_1(/*AUTOINST*/
			   // Outputs
			   .data_out		(paralelo_1),
			   .valid_out		(valid_1),
			   // Inputs
			   .data_in		(phy_tx_out_1),
			   .clk_32f		(clk_32f),
			   .clk_4f		(clk_4f));

    conv_8_32 conv_0(/*AUTOINST*/
		     // Outputs
		     .data_out		(lane_0),
		     .valid_out		(conv_8_32_valid_0),
		     // Inputs
		     .clk_4f		(clk_4f),
		     .valid_0		(valid_0),
		     .data_in		(paralelo_0));

    conv_8_32 conv_1(/*AUTOINST*/
		     // Outputs
		     .data_out		(lane_1),
		     .valid_out		(conv_8_32_valid_1),
		     // Inputs
		     .clk_4f		(clk_4f),
		     .valid_0		(valid_1),
		     .data_in		(paralelo_1));

    byte_unstriping byte_unstriping(/*AUTOINST*/
				    // Outputs
				    .data_out		(data_out),
				    .valid_out		(valid_out),
				    // Inputs
				    .clk_f		(clk_f),
				    .clk_2f		(clk_2f),
				    .valid_0		(conv_8_32_valid_0),
				    .valid_1		(conv_8_32_valid_1),
				    .lane_0		(lane_0),
				    .lane_1		(lane_1));

    endmodule
