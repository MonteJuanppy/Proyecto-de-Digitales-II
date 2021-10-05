//Fecha: 04-10-2021
//Convertidor de 32 bits a 8 bits
//Version 1.0 

module conv_32_8 (input clk, //senal de reloj
    input valid_0, //bit de entrada de validez
    input [31:0] data_in, //entrada de 32 bits
    output reg [7:0] data_out,//salida de 8 bits
    output reg valid_out); //bit de salida de validez

    reg [1:0] contador = 2'b00;//contador

    always @(posedge clk) begin
    if (valid_0 == 1) begin
      case (contador)
        2'b00: data_out = data_in[31:24];
        2'b01: data_out = data_in[23:16];
        2'b10: data_out = data_in[15:8];
        2'b11: data_out = data_in[7:0];
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