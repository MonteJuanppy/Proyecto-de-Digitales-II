clk_gen: clk_4f.v clk_2f.v clk_f.v clk_tb.v
		iverilog -o out clk_tb.v
		vvp out
		gtkwave clk_gen.vcd
		rm out clk_gen.vcd