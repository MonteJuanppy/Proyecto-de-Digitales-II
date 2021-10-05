//Autor: Juan Ignacio Montealegre Salazar
//Fecha: 21-09-2021
//Version 1.2

module Probador1( // Módulo probador: generador de señales y monitor de datos

    output reg clk,
    output reg [31:0] senal_32_bits, //salida de 2 bits
	input [31:0] entrada_32_bits, //entrada de 2 bits
    input [7:0] entrada_8); //entrada de 2 bits
	
	// Generación cíclica de la señal reloj
	initial	clk <= 0; // Valor inicial al reloj, sino siempre ser� indeterminado
	always	#5 clk <= ~clk; // Hace "toggle" cada 5ns

	initial begin

		$dumpfile("Senales.vcd");	// Nombre de archivo del "dump"
		$dumpvars;// Directiva para "dumpear" todas las variables

		reset_L = 0; selector = 0; data_in0 = 2'b00; data_in1 = 2'b00; valid_in = 1'b1;

		$display ("\tclk,\treset_L,\tselector,\tdata_in0,\tdata_in1,\tdata_out_conductual,\tdata_out_estructural, \tValid_in, \ttValid_out");

		// Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
		$monitor("\t%b\t%b\t\t%b\t\t%b\t\t%b\t\t%b\t\t\t%b\t\t\t%d\t\t%d", clk, reset_L, selector, data_in0, data_in1, data_out_conductual, data_out_estructural, valid_in, valid_out);

		@(posedge clk)	// Espera/sincroniza con el flanco positivo del reloj
        
		//Segunda señal (se activa en el primer flanco creciente)
		reset_L <= 1;
		valid_in <= 1;
		data_in0 <= 2'b00;
		data_in1 <= 2'b00;
		selector <= 1'b0;
		
		@(posedge clk)

		//Tercera señal (se activa en el segundo flanco creciente)
		reset_L <= 1;
		data_in0 <= 2'b11;
		data_in1 <= 2'b10;
		selector <= 1'b0;

		@(posedge clk)

		//Cuarta señal (se activa en el tercer flanco creciente). 
		reset_L <= 1;
		data_in0 <= 2'b01;
		data_in1 <= 2'b00;
		selector <= 1'b1;

		@(posedge clk)

		//Quinta señal (se activa en el cuarto flanco creciente)
		reset_L <= 1; 
		data_in0 <= 2'b11;
		data_in1 <= 2'b10;
		selector <= 1'b1;

		@(posedge clk)

		//Sexta señal (se activa en el quinto flanco creciente)
		reset_L <= 0; //Coincide con la señal anterior, por lo que las salidas y entradas permanecen iguales
		valid_in <= 0;
		data_in0 <= 2'b11;
		data_in1 <= 2'b01;
		selector <= 1'b1;

		@(posedge clk)

		//Séptima señal (se activa en el sexta flanco creciente)
		reset_L <= 1;
		data_in0 <= 2'b11;
		data_in1 <= 2'b01;
		selector <= 1'b1;

		@(posedge clk)

		//Octava señal (se activa en el séptima flanco creciente). Coincide con la señal anterior, por lo que las salidas y entradas permanecen iguales
		reset_L <= 1;
		valid_in <= 1;
		data_in0 <= 2'b10;
		data_in1 <= 2'b01;
		selector <= 1'b0;

		@(posedge clk)

		//Novena señal (se activa en el octavo flanco creciente)
		reset_L <= 1;
		data_in0 <= 2'b10;
		data_in1 <= 2'b01;
		selector <= 1'b1;

		#15 $finish;

	end

//Checker que compara las señales de salida
	always @ (posedge clk) begin // sucede en cada flanco positivo de la señal de reloj
	
		if (data_out_conductual != data_out_estructural) //Si las señales son distintas, despliega en la terminal un mensaje
        	$display ("Las señales son diferentes entre el modulo conductual y el modelo estructural del multiplexor");
	end

endmodule
