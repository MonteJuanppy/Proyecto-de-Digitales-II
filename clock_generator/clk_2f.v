module clk_2f(
    input clk_in,
    output reg clk_2);
    reg [27:0] counter = 28'd4;
    parameter df_2 = 28'd16; //divisor de frecuencia

    always @(posedge clk_in)
    begin
      counter<= counter + 28'd1;
        if (counter>=(df_2-1))
            counter <= 28'd0;
            clk_2 <= (counter<df_2/2)?1'b1:1'b0;
    end
endmodule