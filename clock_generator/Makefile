clk_gen: clk_4f.v clk_2f.v clk_f.v clk_tb.v synth_4f.ys synth_2f.ys synth_f.ys synth_4f.v synth_2f.v synth_1f.v
		yosys -s synth_4f.ys
		sed -i 's/clk_4f/ clk_4f_ys/' synth_4f.v
		yosys -s synth_2f.ys
		sed -i 's/clk_2f/ clk_2f_ys/' synth_2f.v
		yosys -s synth_f.ys
		sed -i 's/clk_1f/ clk_1f_ys/' synth_1f.v
		iverilog -o out clk_tb.v
		vvp out
		gtkwave clk_gen.vcd
		rm out clk_gen.vcd