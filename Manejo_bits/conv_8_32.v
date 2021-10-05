//Fecha: 04-10-2021
//Convertidor de 8 bits a 32 bits
//Version 1.0 

module conv_8_32 (input clk,
    input [7:0] dataIn, //entrada de 32 bits
    output reg [31:0] dataOut); //salida de 8 bits

    reg [1:0] contador = 2'b00;//contador

    always @(posedge clk)
    contador <= contador + 1;

    always @* begin
      case (contador)
        2'b00: dataOut[7:0] = dataIn;
        2'b01: dataOut[15:8] = dataIn;
        2'b10: dataOut[23:16] = dataIn;
        2'b11: dataOut[31:24] = dataIn;
        default: dataOut = 32'd00;
      endcase
      
    end

endmodule