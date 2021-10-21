// Fecha: 20-10-2021
// Convertidor señal serial-paralelo
// Version 1.0

// Módulo con la lógica del convertidor de señales
module paralelo_serial (
    input clk_4f,
    input clk_32f,
    input valid_0,
    input [7:0] data_in,
    output reg data_out
);
    
    reg [7:0] data2send;            // Cable para almacenar la señal para la salida en 8 bits
    reg [1:0] contador = 3'b000;    // Contador para sincronizar salida data_out

    always @(posedge clk_4f) begin
    if (valid_0 == 1) begin
        data2send <= data_in;        // Asignar data_in a data2out
    end
        

    else begin
        data2send <= 8'hBC;          // En caso de que valid sea 0 se le asigna hex(BC)
    end

    data_out <= data2send;
        
    end

    always @(posedge clk_32f) begin         // Logica para convertir señal paralelo a serial
        case (contador)
            3'b000: data_out <= data2send[7];
            3'b001: data_out <= data2send[6];
            3'b010: data_out <= data2send[5];
            3'b011: data_out <= data2send[4];
            3'b100: data_out <= data2send[3];
            3'b101: data_out <= data2send[2];
            3'b110: data_out <= data2send[1];
            3'b111: data_out <= data2send[0];
            default: data_out <= 1'b0;
        endcase
    
    contador <= contador + 3'b001;                // Aumentar el contador
    end


endmodule