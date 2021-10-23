 /* ***********************************************************
                    Universidad de Costa Rica
                 Escuela de Ingenieria Electrica
                            IE-0323
                      Circuitos Digitales 1

                        serial_paralelo.v

Descripcion:
  

*********************************************************** */

module serial_paralelo(
	//ENTRADAS
			
			input data_in,			//entrada de datos
			input clk_32f,			//clock frecuencia 32
			input clk_4f,			//clock frecuencia 4
	//SALIDAS
	
			output reg	[7:0] data_out, 	//salida de datos	
			output reg  valid_out			//valid
						
);
			reg [7:0] buffer = 0;					//guarda datos actuales (n)
			reg [7:0] buffer_pasado;		//guarda datos pasados (n-1)
			reg active =1'b0; //active
			integer contador = 0;					//
			reg [2:0] contador2 = 3'b000;	
			integer contador_BC = 0;				//contador de datos BC entrada*se buscan 4
	initial begin
	data_out <= 8'b00000000;
	valid_out <= 1'b0;
	end


	always @(posedge clk_32f) begin

		 case (contador2)
            3'b101: buffer[7] <= data_in;
            3'b110: buffer[6] <= data_in;
            3'b111: buffer[5] <= data_in;
            3'b000: buffer[4] <= data_in;
            3'b001: buffer[3] <= data_in;
            3'b010: buffer[2] <= data_in;
            3'b011: buffer[1] <= data_in;
            3'b100: buffer[0] <= data_in;
            default: buffer <= 0;
        endcase
    
    contador2 = contador2 + 1;                // Aumentar el contador
		
	end
	
	always @(posedge clk_32f)
	
	begin
				
				if (contador_BC == 4 && contador == 1)
				begin
					
					active <= 1;
					
					if (buffer != 8'hBC)
					
					begin
						
						valid_out	<= 1;
						data_out <= buffer;
					end
					
				else if (buffer_pasado != 8'hBC && buffer == 8'hBC)
					
					begin
						
						valid_out	<= 0;
						contador_BC <= 0;
						data_out <= 0;//modificacion
						
					end
			end
				
				if (contador_BC < 4 && buffer == 8'hBC)
				
				begin
					
						valid_out	<= 0;
						data_out <= 0;
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
endmodule

