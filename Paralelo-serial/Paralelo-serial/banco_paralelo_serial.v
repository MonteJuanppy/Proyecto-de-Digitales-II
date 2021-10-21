// `include "clock_generator.v"
`include "paralelo_serial.v"
`include "probador_paralelo_serial.v"

module banco_paralelo_serial;

    wire clk_4f;
    wire clk_32f;
    wire valid_0;
    wire [7:0] data_in;
    wire data_out;

    paralelo_serial conductual(.clk_4f(clk_4f), .clk_32f(clk_32f), .valid_0(valid_0), .data_in(data_in), .data_out(data_out));

    probador_paralelo_serial prob(.clk_4f(clk_4f), .clk_32f(clk_32f), .valid_0(valid_0), .data_in(data_in), .data_out(data_out));

endmodule