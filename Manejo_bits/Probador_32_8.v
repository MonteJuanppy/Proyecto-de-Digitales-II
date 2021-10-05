//Fecha: 04-10-2021
//Version 1.0
`include "clk_f.v"
`include "clk_4f.v"

module Probador_32_8( // Módulo probador: generador de señales y monitor de datos

    output clk,
	output clk4f,
	output reg valid_0,
    output reg [31:0] entrada, //salida de 32 bits
	input valid_out,
    input [7:0] salida); //entrada de 8 bits
	
	reg reloj;
	clk_1f f1(reloj,clk);
	clk_4f f2(reloj,clk4f);

	// Generación cíclica de la señal reloj
	initial	reloj <= 0; // Valor inicial al reloj, sino siempre ser� indeterminado
	always	#10 reloj <= ~reloj; // Hace "toggle" cada 10ns

	initial begin

		$dumpfile("Senales_32_8.vcd");	// Nombre de archivo del "dump"
		$dumpvars;// Directiva para "dumpear" todas las variables

		valid_0 = 0;

		$display("\tclk,\tValid_in,\tSenal_generada,\tSalida_modulo,\tValid_out");

		// Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
		$monitor("\t%b\t%b\t\t%h\t%h\t\t%b", clk, valid_0, entrada, salida, valid_out);

		@(posedge clk)	// Espera/sincroniza con el flanco positivo del reloj
        valid_0 = 1;
		//Segunda señal (se activa en el primer flanco creciente)
		entrada = 32'hFFFFFFFF;
		
		@(posedge clk)

		//Tercera señal (se activa en el segundo flanco creciente)
		entrada = 32'hDDDDDDDD;

		@(posedge clk)
		valid_0 = 0;

		//Cuarta señal (se activa en el tercer flanco creciente). 
		entrada = 32'hFFFFFFFF;

		@(posedge clk)
		valid_0 = 1;

		//Quinta señal (se activa en el cuarto flanco creciente)
		entrada = 32'h00000003;
		@(posedge clk)

		//Sexta señal (se activa en el quinto flanco creciente)
		entrada = 32'h00000000;

		#15 $finish;

	end

endmodule
