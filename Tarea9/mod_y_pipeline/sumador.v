/**
*Universidad de Costa Rica - Escuela de Ingenieria Electrica
*Tarea #8 - IE-0523 - modulo probador.v
*@author Moises Campos Zepeda.
*@date   22/06/2019
*@brief Modulo sumador, con un identificador que se debera retrasar la misma
*cantidad de ciclos que tarda la suma
*/

`include "sum_pipe.v"

module sumador(
               input               clk,
               input               reset_L,
               input       [3:0]   idx,
               input       [3:0]   dataA,
               input       [3:0]   dataB,
               output reg  [3:0]   sum30_dd, 
               output reg  [3:0]   idx_dd   );
    
    /*AUTOWIRE*/ 
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire [3:0]		sum30_dd_in;		// From pipeline of sum_pipe.v
    // End of automatics
    sum_pipe pipeline(/*AUTOINST*/
		      // Outputs
		      .sum30_dd		(sum30_dd_in[3:0]),
		      // Inputs
		      .clk		(clk),
		      .reset_L		(reset_L),
		      .dataA		(dataA[3:0]),
		      .dataB		(dataB[3:0]));

    reg [3:0] idx_d;
    always@(*)begin
        sum30_dd = sum30_dd_in;
    end


    always@( posedge clk )begin
        if(!reset_L)begin
            idx_d   <= 'b0;
            idx_dd  <= 'b0;
        end
        //identificador
        idx_d <= idx;
        idx_dd <= idx_d;
        
    end
endmodule
