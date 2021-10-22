 /* ***********************************************************
                    Universidad de Costa Rica
                 Escuela de Ingenieria Electrica
                            IE-0323
                      Circuitos Digita les 1

                        serial_paralelo.v

Descripcion:
  

*********************************************************** */

module serial_paralelo(
	//ENTRADAS
			
			input IDLin,			//entrada de datos
			input reset,			//
			input clk_32f,			//clock frecuencia 32
			input clk_4f,			//clock frecuencia 4
	//SALIDAS
	
			output reg	[7:0] data_serial_paraleloTX, 		//salida RX
			output reg	active_serial_paraleloTX,		//active
			output reg  IDLEOut			//valid
						
);
			reg [7:0] buffer;					//guarda datos actuales (n)
			reg [7:0] buffer_pasado;			//guarda datos pasados (n-1)
			integer contador;					//
			integer contador_BC;				//contador de datos BC entrada*se buscan 4
	initial begin
	data_serial_paraleloTX <= 8'b00000000;
	active_serial_paraleloTX <=1'b0;
	IDLEOut <= 1'b0;
	end
	
	always @(posedge clk_32f)
	
	begin
			if( reset == 0) 
			
			begin
				
				data_serial_paraleloTX [6:0] <= 8'b00000000;
				active_serial_paraleloTX <= 0;
				IDLEOut	<= 0;
				buffer <= 0;
				contador <= 0;
				contador_BC <= 0;
			end
			
			else
			begin
				buffer <= {buffer[6:0], IDLin};	//en buffer se concatena al ultimo bit de posicion el dato se va llenando de esta manera 
				
				if (contador_BC == 4 && contador == 1)
				begin
					
					active_serial_paraleloTX <= 1;
					
					if (buffer != 8'hBC)
					
					begin
						
						IDLEOut	<= 1;
						data_serial_paraleloTX <= buffer;
					end
					
					else if (buffer_pasado != 8'hBC && buffer == 8'hBC)
					
					begin
						
						IDLEOut	<= 0;
						contador_BC <= 0;
						data_serial_paraleloTX <= 0;//modificacion
						
					end
			end
				
				if (contador_BC < 4 && buffer == 8'hBC)
				
				begin
					
						IDLEOut	<= 0;
						data_serial_paraleloTX <= 0;
						contador_BC <= contador_BC + 1;
				end
					
				if (contador == 1)
				begin
						buffer_pasado <=buffer;
				end
				
				if (contador == 7)
				begin
						contador <= 0;
				end
				
				else if (contador != 7)
				begin
						contador <= contador + 1;
				end
		end
	end
endmodule

