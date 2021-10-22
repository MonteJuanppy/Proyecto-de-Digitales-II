`timescale 1s/1s
`include "serial_paralelo (1).v"
`include "probador_s2p.v"
module paralelo_serial_tb;
    wire reset;
    wire clk_32f; 
    wire clk_4f; 
    wire IDLin;
    wire active_serial_paraleloTX;
    wire [7:0] data_serial_paraleloTX;
    wire IDLEOut;
 

    serial_paralelo serial_paralelo(/*AUTOINST*/
				    // Outputs
				    .active_serial_paraleloTX		(active_serial_paraleloTX),
				    .IDLEOut		(IDLEOut),
				    .data_serial_paraleloTX		(data_serial_paraleloTX[7:0]),
				    // Inputs
				    .clk_32f		(clk_32f),
				    .clk_4f		(clk_4f),
                    .reset      (reset),
				    .IDLin		(IDLin));
    serial_paralelo_tester serial_paralelo_tester(/*AUTOINST*/
						  // Outputs
						  .clk_32f		(clk_32f),
						  .clk_4f		(clk_4f),
						  .IDLin		(IDLin),
						  // Inputs
						  .active_serial_paraleloTX		(active_serial_paraleloTX),
						  .IDLEOut		(IDLEOut),
                          .reset        (reset),
						  .data_serial_paraleloTX		(data_serial_paraleloTX[7:0]));
endmodule