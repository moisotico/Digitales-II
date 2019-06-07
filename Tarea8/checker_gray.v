/**
*Universidad de Costa Rica - Escuela de Ingenieria Electrica
*Tarea #8 - IE-0523 - modulo checker
*@author Moisés Campos Zepeda
*06/06/2019 
*@brief Checker para comparar comportamiento conductual con el estructural
*/

module checker_gray(
    output reg      gray_checks_out,        //salida que indica que ambos datos de la salida son iguales
    input           clk,
    input          reset_L,
    input   [4:0]  salida_gray_c,
    input   [4:0]   salida_gray_e
);
    reg     out_c, out_e;                   //flip-flops

    always@(  * /*posedge clk*/ ) begin
        if( !reset_L ) begin
            out_c = 'b0;
            out_e = 'b0;
            gray_checks_out <= 1;
        end else begin      
            out_c = salida_gray_c;
            out_e = salida_gray_e;
           
            if( reset_L == 1 ) begin        //comparacion en los flancos del reloj
                if( out_c==out_e ) begin
                    gray_checks_out = 1;
                end else begin
                    gray_checks_out = 'b0;
                    $display( $time, " ns, Error: Modules differ!!" );
                end
            end 
        end
    end
endmodule


