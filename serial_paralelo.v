module serial_paralelo(
    input clk_32f,
    input clk_4f,
    input data_in,//en paralelo serial se llama data_out
    output reg [7:0]data_out,
    output reg valid_out,
    output reg active
);
    reg BC_counter;
    reg [7:0] data2send;
    //reg [3:0] contador;

    always @(posedge clk_32f)begin
        if (data_in == 8'b11111111)
            data2send <= 8'hFF;
        else if (data_in == 8'b11101110) begin
            data2send <= 8'hEE;
        end
        else if (data_in == 8'b10111100) begin
            data2send <= 8'hBC;
        end
    end
    always @(posedge clk_4f)begin
        if (BC_counter == 4)begin
            active <= 1;
            BC_counter = 0;
        end
        else begin
            active <= 0;
        end
       if (data_out == 8'hFF || 8'hEE) begin
           valid_out <=1;
       end

        
    end
endmodule

    
         