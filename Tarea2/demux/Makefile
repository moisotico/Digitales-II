 # Makefile de Tarea2
 # Usar <make> para crear el ejecutable y <make run> para ejecutar "iverilog" o "gtkwave".  
 
 OBJECT=BancoPrueba.o 
 
build:
	iverilog -o $(OBJECT) BancoPrueba.v
	vvp $(OBJECT) 
	#yosys synth.ys
	gtkwave demux_1x2.vcd
 
clean:
	rm $(OBJECT)
	rm demux_1x2.vcd
	 

