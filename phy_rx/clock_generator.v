module clock_generator(
    input clk_32f,
    output reg clk_f,
    output reg clk_2f,
    output reg clk_4f
    );

    reg [27:0] counter1 = 28'd4;
    reg [27:0] counter2 = 28'd4;
    reg [27:0] counter3 = 28'd4;
    parameter df_1 = 28'd32; //divisor de frecuencia
    parameter df_2 = 28'd16; //divisor de frecuencia
    parameter df_4 = 28'd8; //divisor de frecuencia

    always @(posedge clk_32f)
    begin
      counter1<= counter1 + 28'd1;
        if (counter1 >=(df_1-1))
            counter1 <= 28'd0;
            clk_f <= (counter1 <df_1/2)?1'b1:1'b0;
    end

    always @(posedge clk_32f)
    begin
      counter2 <= counter2 + 28'd1;
        if (counter2 >=(df_2-1))
            counter2 <= 28'd0;
            clk_2f <= (counter2 <df_2/2)?1'b1:1'b0;
    end
    
    always @(posedge clk_32f)
    begin
      counter3 <= counter3 + 28'd1;
        if (counter3 >=(df_4-1))
            counter3 <= 28'd0;
            clk_4f <= (counter3 <df_4/2)?1'b1:1'b0;
    end
    
endmodule