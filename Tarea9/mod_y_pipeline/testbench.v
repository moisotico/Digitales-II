/*
 *Universidad de Costa Rica - Escuela de Ingenieria Electrica
 *Tarea #8 - IE-0523 - modulo testbench
 *@author Moisés Campos Zepeda
 *@date   22/06/2019
 *@brief  Banco de pruebas del contador_gray con su respectivo probador
*/

`timescale 	1ns				/ 100ps		// escala
// includes de archivos de verilog
`include "sumador.v"
`include "sumador_Synth.v"
`include "probador.v"
`include "CMOS/cmos_cells.v"

module testbench(); // Testbench
	/*AUTOWIRE*/
	// Beginning of automatic wires (for undeclared instantiated-module outputs)
	wire		clk;			// From test0 of probador.v
	wire [3:0]	dataA;			// From test0 of probador.v
	wire [3:0]	dataB;			// From test0 of probador.v
	wire [3:0]	idx;			// From test0 of probador.v
	wire [3:0]	idx_dd_cond;	// From sumador_con of sumador.v
	wire [3:0]	idx_dd_estruc;	// From sumador_con of sumador_Synth.v
	wire		reset_L;		// From test0 of probador.v
	wire [3:0]	sum30_dd_cond;		// From sumador_con of sumador.v
	wire [3:0]	sum30_dd_estruc;	// From sumador_con of sumador_Synth.v	
// End of automatics
	/*AUTOREG*/
	
    // Instanciacion de modulos con los parametros definidos
    sumador sumador_con(/*AUTOINST*/
			// Outputs
			.sum30_dd	(sum30_dd_cond[3:0]),
			.idx_dd		(idx_dd_cond[3:0]),
			// Inputs
			.clk		(clk),
			.reset_L	(reset_L),
			.idx		(idx[3:0]),
			.dataA		(dataA[3:0]),
			.dataB		(dataB[3:0]));

	sumador_Synth sumador_est(/*AUTOINST*/
				  // Outputs
				  .idx_dd		(idx_dd_estruc[3:0]),
				  .sum30_dd		(sum30_dd_estruc[3:0]),
				  // Inputs
				  .clk			(clk),
				  .dataA		(dataA[3:0]),
				  .dataB		(dataB[3:0]),
				  .idx			(idx[3:0]),
				  .reset_L		(reset_L));
	
    probador test0(/*AUTOINST*/
		   // Outputs
		   .clk			(clk),
		   .reset_L		(reset_L),
		   .idx			(idx[3:0]),
		   .dataA		(dataA[3:0]),
		   .dataB		(dataB[3:0]),
		   // Inputs
		   .idx_dd_cond		(idx_dd_cond[3:0]),
		   .idx_dd_estruc	(idx_dd_estruc[3:0]),
		   .sum30_dd_cond	(sum30_dd_cond[3:0]),
		   .sum30_dd_estruc	(sum30_dd_estruc[3:0]));

endmodule
