clk_gen: clock_generator.v clk_tb.v 
		yosys -s clock_generator.ys
		sed -i 's/clock_generator/ yosys_clock_generator/' yosys_clock_generator.v
		iverilog -o out clk_tb.v
		vvp out
		gtkwave clk_gen.vcd
