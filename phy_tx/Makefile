#Fecha: 21-10-2021
#Version 1.0
#Archivo Makefile

CC = iverilog
PP = vvp

Compile: banco_phy_tx.v probador_phy_tx.v phy_tx.v 
	yosys -s yosys_phy_tx.ys
	sed -i 's/phy_tx/yosys_phy_tx/' yosys_phy_tx.v 
	sed -i 's/byte_striping/yosys_byte_striping/' yosys_phy_tx.v 
	sed -i 's/clock_generator/yosys_clock_generator/' yosys_phy_tx.v 
	sed -i 's/conv_32_8/yosys_conv_32_8/' yosys_phy_tx.v 
	sed -i 's/paralelo_serial/yosys_paralelo_serial/' yosys_phy_tx.v 
	sed -i 's/yosys_phy_tx_out_0/phy_tx_out_0/' yosys_phy_tx.v 
	sed -i 's/yosys_phy_tx_out_1/phy_tx_out_1/' yosys_phy_tx.v 
	$(CC) -o phy_tx.vpp banco_phy_tx.v 
	$(PP) phy_tx.vpp
	gtkwave phy_tx.vcd