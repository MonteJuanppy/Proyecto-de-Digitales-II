//Fecha: 04-10-2021
//Convertidor de 8 bits a 32 bits
//Version 1.0 

module conv_8_32 (input clk, //senal de reloj
    input valid_0, //bit de entrada de validez
    input [7:0] data_in, //entrada de 32 bits
    output reg [31:0] data_out,//salida de 8 bits
    output reg valid_out); //bit de salida de validez

    reg [1:0] contador = 2'b00;//contador

    always @(posedge clk) begin
    if (valid_0 == 1) begin
      case (contador)
        2'b00: data_out[31:24] = data_in;
        2'b01: data_out[23:16] = data_in;
        2'b10: data_out[15:8] = data_in;
        2'b11: data_out[7:0] = data_in;
        default: data_out = 8'h00;
      endcase
      contador = contador + 1;
      valid_out <= valid_0;
      end
    else begin
        valid_out <= valid_0;
        contador = 2'b00;
    end
    end

endmodule

