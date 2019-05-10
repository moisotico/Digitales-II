# Makefile para la Tarea6, con bit de valid
# Usar <make> para ejecutar <iverilog>, <gtkwave> y el script en <yosys>. 
# Usar <make clear> para eliminar los objetos y ejecutables creados   

VERILOG_MOD=demux_valid.v 
VERILOG_SRC=src/BancoPrueba.v
OBJECT=src/BancoPrueba.o 
VCD=demux_1x2.vcd
YS=synth.ys


build:
	#Script de yosys con modificacion mediante $sed
	sed -i -E 's/[^ +/]*\.v/$(VERILOG_MOD)/' $(YS)	
	yosys $(YS)
	#sed -i -E 's/[^ +/]*\.v/$(VERILOG_MOD)/' $(VERILOG_SRC)	

	#run iverilog and object
	iverilog -o $(OBJECT) $(VERILOG_SRC)
	vvp $(OBJECT) 

	#warning
	echo "Se remplaza el .v por $(VERILOG_SRC)"
	
	#GTKWave
	gtkwave $(VCD)

clean:
	rm $(OBJECT) || rm $(VCD)
