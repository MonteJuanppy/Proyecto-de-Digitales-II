module probador_s2p(
    output reg clk_32f, 
    output reg clk_4f,
    output reg data_in,//en paralelo serial se llama active_serial_paraleloTX
    input wire [7:0] data_out,
    input wire valid_out
);
    initial begin
      $dumpfile("serial_paralelo.vcd");
      $dumpvars;
    //start here
    
    @(posedge clk_32f);//Encima de (0)
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
    //el que esta arriba de 0xBC(1)
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
    //encima de 0XBC(2)
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
    //encima de (3)
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
    
    //xd2
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
    #300 $finish;
    end
    initial data_in <=1'b0;
    initial clk_32f <= 0;
	always #2 clk_32f <= ~clk_32f;

	initial clk_4f <= 0;
	always #4 clk_4f <= ~clk_4f;
endmodule