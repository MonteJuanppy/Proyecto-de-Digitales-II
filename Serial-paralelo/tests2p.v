`timescale 1s/1s
`include "serial_paralelo.v"
`include "probador_s2p.v"
module paralelo_serial_tb;
    wire clk_32f; 
    wire clk_4f; 
    wire data_in;
    wire [7:0] data_out;
    wire valid_out;
 

    serial_paralelo serial_paralelo(/*AUTOINST*/
				    // Outputs
				    .data_out		(data_out[7:0]),
				    .valid_out		(valid_out),
				    // Inputs
				    .data_in		(data_in),
				    .clk_32f		(clk_32f),
				    .clk_4f		(clk_4f));
    probador_s2p probador_s2p(/*AUTOINST*/
			      // Outputs
			      .clk_32f		(clk_32f),
			      .clk_4f		(clk_4f),
			      .data_in		(data_in),
			      // Inputs
			      .data_out		(data_out[7:0]),
			      .valid_out	(valid_out));
endmodule
