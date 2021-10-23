#Fecha: 21-10-2021
#Version 1.0
#Archivo Makefile

CC = iverilog
PP = vvp

Compile: banco_phy.v probador_phy.v phy_tx.v phy_rx.v phy.v 
	yosys -s yosys_phy.ys
	$(CC) -o phy.vpp banco_phy.v 
	$(PP) phy.vpp
	gtkwave phy.vcd