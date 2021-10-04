module clk_1f(
    input clk_in,
    output reg clk_1
    );
    reg [27:0] counter = 28'd4;
    parameter df_1 = 28'd32; //divisor de frecuencia

    always @(posedge clk_in)
    begin
      counter<= counter + 28'd1;
        if (counter>=(df_1-1))
            counter <= 28'd0;
            clk_1 <= (counter<df_1/2)?1'b1:1'b0;
    end
endmodule