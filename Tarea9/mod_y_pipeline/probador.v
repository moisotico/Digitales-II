/*
*Universidad de Costa Rica - Escuela de Ingenieria Electrica
*Tarea #8 - IE-0523 - modulo probador.v
*@author Moisés Campos Zepeda.
*@date   22/06/2019
*@brief  Probador del sumador con dos buses utilizando pipeline.
 */

`include "checker_sumador.v"
//`include "sumador.v"

module probador(
    output reg          clk,
    output reg          reset_L,
    output reg  [3:0]   idx,
    output reg  [3:0]   dataA,
    output reg  [3:0]   dataB,
    input       [3:0]   idx_dd_cond,
    input       [3:0]   idx_dd_estruc,
    input       [3:0]   sum30_dd_cond,
    input       [3:0]   sum30_dd_estruc);
    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
 //   wire		sumador_checks_out;	// From sum_check of checker_sumador.v
    // End of automatics

    
   checker_sumador sum_check(/*AUTOINST*/
  		     // Outputs
			     .sumador_checks_out(sumador_checks_out),
  		     // Inputs
			     .clk		(clk),
			     .reset_L		(reset_L),
			     .salida_sumador_c	(sum30_dd_cond[3:0]),
			     .salida_sumador_e	(sum30_dd_estruc[3:0]));


    initial begin
        $dumpfile("sumador.vcd");
        $dumpvars;
        
        // Pruebas #1: Reset bajo.
        @(posedge clk);
        reset_L <= 0;
        dataA <= 0;
        dataB <= 0;
        idx   <= 0;
       // Prueba #2: Reset alto. Valido primer dato
        #1; 
        @(posedge clk);
        reset_L <= 1;
        
        repeat(20) begin
        @(posedge clk);
            dataA <= dataA + 1;
            dataB <= dataB + 1;
            idx <= idx + 1;
        end
/*
        repeat(4) begin
        @(posedge clk);
        //count <= count + 1;
        end

        repeat(2) begin
        @(posedge clk);
        enable <= 0;
        end

        repeat(2) begin
        @(posedge clk);
        reset_L <= 0;
        end   
*/
        $finish;    
   end

    initial begin
    clk <=0;
    end

    always #2 clk <=~clk;


endmodule

