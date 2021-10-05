//Fecha: 04-10-2021
//Version 1.0
`include "clk_f.v"
`include "clk_4f.v"

module Probador_8_32( // Módulo probador: generador de señales y monitor de datos

    output clk,
	output clk4f,
	output reg valid_0,
    output reg [7:0] entrada, //salida de 8 bits
	input valid_out,
    input [31:0] salida); //entrada de 32 bits

	// Generación cíclica de la señal reloj
	initial	clk <= 0; // Valor inicial al reloj, sino siempre ser� indeterminado
	initial clk4f <= 0;
	always	#24 clk <= ~clk; // Hace "toggle" cada 10ns
	always	#6 clk4f <= ~clk4f; // Hace "toggle" cada 10ns

	initial begin

		$dumpfile("Senales_8_32.vcd");	// Nombre de archivo del "dump"
		$dumpvars;// Directiva para "dumpear" todas las variables

		valid_0 = 0;

		$display("\tclk,\tValid_in,\tSenal_generada,\tSalida_modulo,\tValid_out");

		// Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
		$monitor("\t%b\t%b\t\t%h\t%h\t\t%b", clk, valid_0, entrada, salida, valid_out);

		@(posedge clk4f)	// Espera/sincroniza con el flanco positivo del reloj
		entrada = 8'hFF;
		
		@(posedge clk4f)
		valid_0 = 1;
        @(posedge clk4f)
        @(posedge clk4f)

        @(posedge clk4f)
        entrada = 8'hDD;

        @(posedge clk4f)
        @(posedge clk4f)
        @(posedge clk4f)


		@(posedge clk4f)
		valid_0 = 0;

        @(posedge clk4f)
        @(posedge clk4f)
        @(posedge clk4f)

        @(posedge clk4f)
        entrada = 8'h00;

        @(posedge clk4f)
        @(posedge clk4f)
        @(posedge clk4f)
        entrada = 8'h03;
		@(posedge clk4f)

		#15 $finish;

	end

endmodule
