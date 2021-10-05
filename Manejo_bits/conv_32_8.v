//Fecha: 04-10-2021
//Convertidor de 32 bits a 8 bits
//Version 1.0 

module conv_32_8 (input clk,
    input [31:0] dataIn, //entrada de 32 bits
    output reg [7:0] dataOut); //salida de 8 bits

    reg [1:0] contador = 2'b00;//contador

    always @(posedge clk)
    contador <= contador + 1;

    always @* begin
      case (contador)
        2'b00: dataOut = dataIn[7:0];
        2'b01: dataOut = dataIn[15:8];
        2'b10: dataOut = dataIn[23:16];
        2'b11: dataOut = dataIn[31:24];
        default: dataOut = 8'd00;
      endcase
      
    end

endmodule