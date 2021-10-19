`timescale 	1s				/ 1s
`include "byte_unstriping.v"
`include "probador_unstriping.v"

module pruebas_unstriping;


    wire clk_2f;
    wire clk_f;
    wire valid_out;
    wire valid_0;
    wire valid_1;
	
    wire [31:0] lane_0;
    wire [31:0] lane_1;

    
    wire [31:0] data_out;

		byte_unstrip byte_unStr(/*AUTOINST*/
        //Outputs
        .lane_0 (lane_0[31:0]),
        .lane_1 (lane_1[31:0]),
        .valid_0 (valid_0),
        .valid_1 (valid_1),
		//Inputs
		.clk_f (clk_f),
        .clk_2f (clk_2f),
        .valid_out (valid_out),
        .data_out (data_out[31:0])
        );

		probadorbyte_unstriping muxp_unstriping(/*AUTOINS*/
		//Outputs
        .lane_0 (lane_0[31:0]),
        .lane_1 (lane_1[31:0]),
        .valid_0 (valid_0),
        .valid_1 (valid_1),
		//Inputs
		.clk_f (clk_f),
        .clk_2f (clk_2f),
        .valid_out (valid_out),
        .data_out (data_out[31:0]));
endmodule