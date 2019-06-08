/*
*Universidad de Costa Rica - Escuela de Ingenieria Electrica
*Tarea #8 - IE-0523 - modulo probador.v
*@author Moisés Campos Zepeda.
*@date   06/06/2019
*@brief  Probador del contador_gray para modelo conductual y el estructural dado
 */

`include "checker_gray.v"

module probador(
    output reg          clk,
    output reg          enable,
    output reg          reset_L,
    input       [4:0]   salida_gray_cond,
    input       [4:0]   salida_gray_estruct);

    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire		gray_checks_out;	// From gray_check of checker_gray.v
    // End of automatics

   checker_gray gray_check(/*AUTOINST*/
			   // Outputs
			   .gray_checks_out	(gray_checks_out),
			   // Inputs
			   .clk			(clk),
			   .reset_L		(reset_L),
			   .salida_gray_c	(salida_gray_cond[4:0]),
			   .salida_gray_e	(salida_gray_estruct[4:0]));

    initial begin
        $dumpfile("contador_gray.vcd");
        $dumpvars;
        
        // Pruebas #1: Reset bajo. 
        enable <= 0;
        
        repeat(2) begin
        @(posedge clk);
        reset_L <= 0;
        //  count <= 0;
        end

       // Prueba #2: Reset alto. Valido primer dato
        enable <= 1;
        reset_L <= 1;
        
        repeat(596) begin
        @(posedge clk);
        //count <= count + 1;
        end

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

        $finish;    
   end

    initial begin
    clk <=0;
    //count <= 0;
    end

    always #2 clk <=~clk;


endmodule

