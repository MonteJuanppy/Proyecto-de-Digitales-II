module byte_striping(
    input clk_2f,
    input [31:0] data_in,
    input valid_in,
    output reg [31:0] lane_0,
    output reg [31:0] lane_1,
    output reg valid_0,
    output reg valid_1
);

    reg counter = 0;
initial begin
    lane_0<=32'h00000000;
    lane_1<=32'h00000000;
    valid_0 <= 1'b1;
    valid_1 <= 1'b1;

end
    always @(posedge clk_2f ) begin
        if (counter==1) 
            begin
            if (valid_in ==0) 
                begin
                    valid_0 <= 1'b0;
                    lane_0 <= 32'h00000000;
                    
                end 
            else 
                begin
                    valid_0 <= 1'b1;
                    lane_0 <= data_in;
       
                end
            
            
            end 
            
        else begin
                if (valid_in ==0) 
                begin
                    valid_1 <= 1'b0;
                    lane_1 <= 32'h00000000;   
                end 
                else 
                begin
                    valid_1 <= 1'b1;
                    lane_1 <= data_in;    
                end
            
            end
        counter = ~counter;
    end
        

endmodule