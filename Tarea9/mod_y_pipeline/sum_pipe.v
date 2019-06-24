/**
*Universidad de Costa Rica - Escuela de Ingenieria Electrica
*Tarea #8 - IE-0523 - modulo probador.v
*@author Moisés Campos Zepeda.
*@date   22/06/2019
*@brief Modulo sumador un sumador que trabaja los segmentos menos significativas
*de ambos buses y los almacene en un flop. Luego, sume las partes más
*significativas más el acarreo de la suma anterior y los almacene en otro flop.
*/

module sum_pipe(
                input               clk,
                input               reset_L,
                //input       [3:0]   idx,
                input       [3:0]   dataA,
                input       [3:0]   dataB,
                //output reg  [3:0]   idx_dd,
                output reg  [3:0]   sum30_dd 
                );

    //ffs
    reg [3:0] sum10_d, sum30_d;
    reg [3:0] data_A_d, data_B_d;
    reg acarreo_d;


    always@(*) begin
        acarreo_d = sum10_d[2];
    end

    
    
    always@( posedge clk )begin
        if (!reset_L)begin
            acarreo_d   <= 'b0;
            sum10_d     <= 'b0;
            data_A_d    <= 'b0;
            data_B_d    <= 'b0;
            sum30_d     <= 'b0;
            sum30_dd    <= 'b0;

        end
        else begin
        //Etapa 1
            sum10_d <= dataA[1:0] + dataB[1:0];
        
        //Etapa 2
            data_A_d<= dataA;          
            data_B_d<= dataB;
            sum30_d[3:2] <= data_A_d[3:2] + data_B_d[3:2] + acarreo_d;
            sum30_d[1:0] <= sum10_d[1:0];
        
        //Etapa3
            sum30_dd <= sum30_d;
        end
    end
endmodule
