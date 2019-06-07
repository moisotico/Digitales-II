/*
 *Universidad de Costa Rica - Escuela de Ingenieria Electrica
 *Proyecto #1 - IE-0523 - modulo tb del serialtopar
 *@author Giancarlo Marin H.
 *@date   29/05/2019
 *@brief  Banco de pruebas del phy para el pcie con su respectivo probador
*/

`timescale 	1ns				/ 100ps		// escala
// includes de archivos de verilog
`include "contador_gray_cond.v"
`include "contador_gray_synth.v"
`include "probador.v"
`include "cmos_cells.v"

module testbench(); // Testbench
	/*AUTOWIRE*/
	

	// Instanciacion de modulos con los parametros definidos
	contador_gray_cond contador_con(/*autoinst*/);

	contador_gray_synth contador_est(/*autoinst*/);
		
	probador test (/*autoinst*/);

endmodule
