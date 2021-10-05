module probadorbyte(
    output reg clk_f,
    output reg clk_2f,
    output reg [31:0] data_in,
    output reg valid_in,
    input [31:0] lane_0,
    input [31:0] lane_1,
    input valid_0,
    input valid_1);
	initial begin
	$dumpfile("probador.vcd");
	$dumpvars;

	
	{data_in} <= 32'h00000000;
    {valid_in} <= 1;


	@(posedge clk_2f);

    {valid_in} <= 1;
	data_in <= 32'hFFFFFFFF;

	@(posedge clk_2f);

    data_in <= 32'hEEEEEEEE;


    @(posedge clk_2f);
 
    data_in <= 32'hDDDDDDDD;

	@(posedge clk_2f);
	
    valid_in <=1;
    data_in <= 32'hCCCCCCCC;

      
    @(posedge clk_2f);
    valid_in <=0;
    data_in <= 32'hBBBBBBBB;

	@(posedge clk_2f);
	valid_in <=0;
    data_in <= 32'hAAAAAAAA;

 
 
	$finish;
	end
	
	//initial clk_4f <= 0;
	//always #1 clk_4f <= ~clk_4f;

	initial clk_2f <= 0;
	always #2 clk_2f <= ~clk_2f;

	initial clk_f <= 0;
	always #4 clk_f <= ~clk_f;


endmodule