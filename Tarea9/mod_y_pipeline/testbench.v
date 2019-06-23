/*
 *Universidad de Costa Rica - Escuela de Ingenieria Electrica
 *Tarea #8 - IE-0523 - modulo testbench
 *@author Moisés Campos Zepeda
 *@date   06/06/2019
 *@brief  Banco de pruebas del contador_gray con su respectivo probador
*/

`timescale 	1ns				/ 100ps		// escala
// includes de archivos de verilog
`include "contador_gray_cond.v"
`include "contador_gray_synth.v"
`include "probador.v"
`include "CMOS/cmos_cells.v"

module testbench(); // Testbench
	/*AUTOWIRE*/
	// Beginning of automatic wires (for undeclared instantiated-module outputs)
	wire		clk;			// From test0 of probador.v
	wire		enable;			// From test0 of probador.v
	wire		reset_L;		// From test0 of probador.v
	wire [4:0]	salida_gray_cond;		// From contador_con of contador_gray_cond.v
    wire [4:0]  salida_gray_estruct;        // From contador_est of contador_gray_synth.v
// End of automatics
	/*AUTOREG*/
	
    // Instanciacion de modulos con los parametros definidos
    contador_gray_cond contador_con(/*autoinst*/
				    // Outputs
				    .salida_gray	(salida_gray_cond[4:0]),
				    // Inputs
				    .clk		    (clk),
				    .enable		    (enable),
				    .reset_L		(reset_L));

	contador_gray_synth contador_est(/*autoinst*/
					 // Outputs
					 .salida_gray		(salida_gray_estruct[4:0]),
					 // Inputs
					 .clk			(clk),
					 .enable		(enable),
					 .reset_L		(reset_L));
	
    probador test0(/*autoinst*/
		   // Outputs
		   .clk			(clk),
		   .enable		(enable),
		   .reset_L		(reset_L),
		   // Inputs
		   .salida_gray_cond	(salida_gray_cond[4:0]),
		   .salida_gray_estruct	(salida_gray_estruct[4:0]));

endmodule
