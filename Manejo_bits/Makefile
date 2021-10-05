#Fecha: 04-10-2021
#Version 1.0
#Archivo Makefile

CC = iverilog
PP = vvp

Conv_32_8_bits: Testbench_32_8.v Probador_32_8.v conv_32_8.v 
	$(CC) -o conv_32_8.vpp Testbench_32_8.v 
	$(PP) conv_32_8.vpp
	gtkwave Senales_32_8.vcd

Conv_8_32_bits: Testbench_8_32.v Probador_8_32.v conv_8_32.v 
	$(CC) -o conv_8_32.vpp Testbench_8_32.v 
	$(PP) conv_8_32.vpp
	gtkwave Senales_8_32.vcd