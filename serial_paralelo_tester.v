module serial_paralelo_tester(
    output reg clk_32f,
    output reg clk_4f,
    output reg data_in,//en paralelo serial se llama data_out
    input wire [7:0]data_out,
    input wire valid_out,
    input wire active
);
    initial begin
      $dumpfile("serial_paralelo.vcd");
      $dumpvars;


    @(posedge clk_32f);
      {data_in} <= 1;
    @(posedge clk_32f);
      {data_in} <= 1;
    @(posedge clk_32f);
      {data_in} <= 1;
    @(posedge clk_32f);
      {data_in} <= 1;
    @(posedge clk_32f);
      {data_in} <= 1;
    @(posedge clk_32f);
      {data_in} <= 1;
    @(posedge clk_32f);
      {data_in} <= 1;
    @(posedge clk_32f);
      {data_in} <= 1;
    //xd
    @(posedge clk_32f);
      {data_in} <= 1;
    @(posedge clk_32f);
      {data_in} <= 1;
    @(posedge clk_32f);
      {data_in} <= 1;
    @(posedge clk_32f);
      {data_in} <= 0;
    @(posedge clk_32f);
      {data_in} <= 1;
    @(posedge clk_32f);
      {data_in} <= 1;
    @(posedge clk_32f);
      {data_in} <= 1;
    @(posedge clk_32f);
      {data_in} <= 0;
    //xd 
    @(posedge clk_32f);
      {data_in} <= 1;
    @(posedge clk_32f);
      {data_in} <= 0;
    @(posedge clk_32f);
      {data_in} <= 1;
    @(posedge clk_32f);
      {data_in} <= 1;
    @(posedge clk_32f);
      {data_in} <= 1;
    @(posedge clk_32f);
      {data_in} <= 1;
    @(posedge clk_32f);
      {data_in} <= 0;
    @(posedge clk_32f);
      {data_in} <= 0;
    #1000 $finish;
    end

    initial clk_32f <= 0;
	always #2 clk_32f <= ~clk_32f;

	initial clk_4f <= 0;
	always #4 clk_4f <= ~clk_4f;
endmodule