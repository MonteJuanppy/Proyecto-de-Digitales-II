module probadorbyte_unstriping(
    output reg clk_f,
    output reg clk_2f,
    output reg valid_0,
    output reg valid_1,
    output reg [31:0] lane_0,
    output reg [31:0] lane_1,
    input [31:0] data_out,
    input valid_out,

	initial begin
	$dumpfile("probador_unstriping.vcd");
	$dumpvars;

	
	{lane_0} <= 32'h00000000;
    {lane_1} <= 32'h00000000;
    {valid_out} <= 1;


	@(posedge clk_f);

    {valid_out} <= 1;
	lane_0 <= 32'hFFFFFFFF;
    lane_1 <= 32'hFFFFFFFF;

	@(posedge clk_f);

    lane_0 <= 32'hEEEEEEEE;
    lane_1 <= 32'hEEEEEEEE;

    @(posedge clk_f);
 
    lane_0 <= 32'hDDDDDDDD;
    lane_1 <= 32'hDDDDDDDD;

	@(posedge clk_f);
	
    valid_out <=1;
    lane_0 <= 32'hCCCCCCCC;
    lane_1 <= 32'hCCCCCCCC;

    @(posedge clk_f);
    valid_out <=0;
    lane_0 <= 32'hBBBBBBBB;
    lane_1 <= 32'hBBBBBBBB;

	@(posedge clk_f);
	valid_out <=0;
    lane_0 <= 32'hAAAAAAAA;
    lane_1 <= 32'hAAAAAAAA;

 
 
	$finish;
	end
	
	//initial clk_4f <= 0;
	//always #1 clk_4f <= ~clk_4f;

	initial clk_f <= 0;
	always #4 clk_f <= ~clk_f;

	initial clk_2f <= 0;
	always #2 clk_2f <= ~clk_2f;


endmodule