module clk_4f(
    input clk_in,
    output reg clk_4
    );
    reg [27:0] counter = 28'd4;
    parameter df_4 = 28'd8; //divisor de frecuencia

    always @(posedge clk_in)
    begin
      counter<= counter + 28'd1;
        if (counter>=(df_4-1))
            counter <= 28'd0;
            clk_4 <= (counter<df_4/2)?1'b1:1'b0;
    end
endmodule