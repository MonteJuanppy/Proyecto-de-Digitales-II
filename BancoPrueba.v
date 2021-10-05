`timescale 	1s				/ 1s
`include "byte_striping.v"
`include "probador.v"

module pruebas;


    wire clk_2f;
    wire clk_f;
    wire valid_in;
    wire valid_0;
    wire valid_1;
	
    wire [31:0] data_in;

    
    wire [31:0] lane_0;
    wire [31:0] lane_1;

		byte_strip byte_Str(/*AUTOINST*/
        //Outputs
        .lane_0 (lane_0[31:0]),
        .lane_1 (lane_1[31:0]),
        .valid_0 (valid_0),
        .valid_1 (valid_1),
		//Inputs
		.clk_f (clk_f),
        .clk_2f (clk_2f),
        .valid_in (valid_in),
        .data_in (data_in[31:0])
        );

		probadorbyte muxp(/*AUTOINS*/
		//Outputs
        .lane_0 (lane_0[31:0]),
        .lane_1 (lane_1[31:0]),
        .valid_0 (valid_0),
        .valid_1 (valid_1),
		//Inputs
		.clk_f (clk_f),
        .clk_2f (clk_2f),
        .valid_in (valid_in),
        .data_in (data_in[31:0]));
endmodule
