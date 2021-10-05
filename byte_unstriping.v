module byte_unstrip(
    input clk_f,
    input clk_2f,
    input valid_0,
    input valid_1,
    input [31:0] lane_0,
    input [31:0] lane_1,
    output reg [31:0] data_out,
    output reg valid_out,
    
);
initial begin
    data_in<=32'h00000000;
    valid_ <= 1'b0;


end
    always @(posedge clk_2f ) 
        begin
            if (valid_0 == 0) 
                begin
                    valid_out <= 1'b0;
                    lane_0 <= 32'h00000000;
                    
                end 
            else 
                begin
                    valid_out <= 1'b1;
                    data_out = lane_0;

                    
                end
            
        end
    always @(negedge clk_2f ) 
        begin
            if (valid_1 == 0) 
                begin
                    valid_out <= 1'b0;
                    lane_1 <= 32'h00000000;
                    
                end 
            else 
                begin
                    valid_out <= 1'b1;
                    data_out = lane_1;

                    
                end
            
        end
    


endmodule