// `include "clock_generator.v"

module probador_paralelo_serial( // Módulo probador: generador de señales y monitor de datos

    output reg clk_32f,
	output reg clk_4f,
	output reg valid_0,
    output reg [7:0] data_in, //salida de 8 bits
	input data_out); 

	// Generación cíclica de la señal reloj
	initial clk_32f <= 0;
	initial clk_4f <= 0;
	always	#1 clk_32f <= ~clk_32f; // Hace "toggle" cada 10ns
	always	#8 clk_4f <= ~clk_4f; // Hace "toggle" cada 10ns

    /* clock_generator test_clk(.clk_4f(clk_4f), .clk_32f(clk_32f)) */

	initial begin

		$dumpfile("paralelo_serial.vcd");	// Nombre de archivo del "dump"
		$dumpvars;// Directiva para "dumpear" todas las variables 

		valid_0 = 0;

        
		$display("\tclk,\tValid_in,\tSenal_generada,\tSalida_modulo,\tValid_out");

		// Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
		$monitor("\t%b", valid_0);
        


		@(posedge clk_4f)	// Espera/sincroniza con el flanco positivo del reloj
		data_in = 8'hFF;
		
		@(posedge clk_4f)
		valid_0 = 1;
        @(posedge clk_4f)
        @(posedge clk_4f)

        @(posedge clk_4f)
        data_in = 8'hEE;

        @(posedge clk_4f)
        @(posedge clk_4f)
        @(posedge clk_4f)


		@(posedge clk_4f)
		valid_0 = 0;

        @(posedge clk_4f)
        @(posedge clk_4f)
        @(posedge clk_4f)

        @(posedge clk_4f)
        data_in = 8'h7F;

        @(posedge clk_4f)
        @(posedge clk_4f)
        @(posedge clk_4f)
        data_in = 8'h03;
		@(posedge clk_4f)

		#15 $finish;

	end

endmodule