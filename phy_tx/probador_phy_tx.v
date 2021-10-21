// Fecha: 21-10-2021
// Probador del transmisor phy_tx
// Version 1.0

module probador_phy_tx(
    output reg clk_32f,
    output reg [31:0] data_in,
    output reg valid_in,
    input phy_tx_out_0,
    input phy_tx_out_1);

	initial clk_32f <= 0;
    reg clk = 0 ;
	always #1 clk_32f <= ~clk_32f;
    always #32 clk <= ~clk;


	initial begin
	$dumpfile("phy_tx.vcd");
	$dumpvars;

	
	{data_in} <= 32'h00000000;
    {valid_in} <= 1;


	@(posedge clk);

    {valid_in} <= 1;
	data_in <= 32'hFFFFFFFF;

	@(posedge clk);

    data_in <= 32'hEEEEEEEE;


    @(posedge clk);
 
    data_in <= 32'hDDDDDDDD;

	@(posedge clk);
	
    valid_in <=1;
    data_in <= 32'hCCCCCCCC;

      
    @(posedge clk);
    valid_in <=0;
    data_in <= 32'hBBBBBBBB;

	@(posedge clk);
	valid_in <=0;
    data_in <= 32'hAAAAAAAA;
 
	#15 $finish;
	end


endmodule