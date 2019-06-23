/*
*Universidad de Costa Rica - Escuela de Ingenieria Electrica
*Tarea #8 - IE-0523 - modulo probador.v
*@author Moisés Campos Zepeda.
*@date   22/06/2019
*@brief  Probador del sumador con dos buses utilizando pipeline.
 */

`include "sum_pipe.v"
//`include "sumador.v"

module probador(
    output reg          clk,
    output reg          reset_L,
    output reg  [3:0]   idx,
    output reg  [3:0]   dataA,
    output reg  [3:0]   dataB,
    input       [3:0]   idx_dd,
    input       [3:0]   sum30_dd;

    /*AUTOWIRE*/

   checker_sumador sum_check(/*AUTOINST*/);

    initial begin
        $dumpfile("contador_gray.vcd");
        $dumpvars;
        
        // Pruebas #1: Reset bajo.
        
        repeat(2) begin
        @(posedge clk);
        reset_L <= 0;
        //  count <= 0;
        end
/*
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
*/
        $finish;    
   end

    initial begin
    clk <=0;
    end

    always #2 clk <=~clk;


endmodule

