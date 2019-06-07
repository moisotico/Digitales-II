# Tarea 8 de Digitales-II
Verificación de un contador gray de 5 bits

## Descripción
Se diseña un testbench, un probador con verificador automático y una descripción
conductual del contador gray en Verilog.

## Para ejecutar:
```
$ make all
```

El makefile también puede correr las siguientes reglas:
```bash
$ make compile  # Compila el <archivo>.v y genera un <archivo>.o .
$ make sim      # genera la simulacion del módulo a verificar y el conductual a comparar en GTKWave.
$ make run      # Corre el archivo de manera que genera del output un vcd para el GTKWave.
$ make tb       # Visualiza las formas de onda de las pruebas completas con GTKWave del banco de pruebas.
$ make clean    # Elimina archivos intermedios generados.
$ make all      # Ejecuta todos los procesos en el orden anterior.
```
