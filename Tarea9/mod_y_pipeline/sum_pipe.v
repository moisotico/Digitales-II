/**
*Universidad de Costa Rica - Escuela de Ingenieria Electrica
*Tarea #8 - IE-0523 - modulo probador.v
*@author Moisés Campos Zepeda.
*@date   22/06/2019
*@brief Modulo sumador un sumador que trabaja los segmentos menos significativas
*de ambos buses y los almacene en un flop. Luego, sume las partes más
* significativas más el acarreo de la suma anterior y los almacene en otro flop.
*/

module sum_pipe(
                input clk,
                input reset_L,
                input idx[3:0],
                input dataA[3:0],
                input dataB[3:0],
                output reg idx_dd[3:0],
                output reg sum30_dd[3:0] 
                );
//ffs
reg [3:0] sum10, sum10_d, sum30_d;
reg [3:0] data_A_d, data_B_d;
reg acarreo, acarreo_d;

    always@(posedge clk) begin
    //Etapa 1
        sum10 <= dataA[1:0] + dataB[1:0];
        acarreo <= sum10[2];
    
    //Etapa 2
        data_A_d[3:2] <= dataA[3:2];          
        data_B_d[3:2] <= dataB[3:2];          
        sum10_d <= sum10;
        acarreo_d <= acarreo;
        sum30_d[3:2] <= data_A_d[3:2] + data_B_d[3:2] + acarreo_d[0];
        sum30_d[1:0] <= sum10_d;
    
    //Etapa3
        sum30_dd <= sum30_d;
    
    end
endmodule
