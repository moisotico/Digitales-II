`timescale 1ns/100ps

/**
* Flip Flop
* SN74LVC1G175
* http://www.ti.com/product/SN74LVC1G175/description?keyMatch=single%20flip%20flop%20clear&tisearch=Search-EN-Everything
* Use @ [1.65 ,  5.5] V Vcc
**/

module ff_d_nand(
    output reg Q,
    input D, CLK, CLR_BAR   
);
 /**   
    nand G1(X, D, CLK);
    nand G2(Y, X, CLK);
    nand G3(Q, Q_NEG, X);
    nand G4(Q_NEG,Q,Y);
 **/

    parameter Vcc = 5;
    parameter t_hmin = 0.5;
    parameter t_hmax = 0.7;
    //parameter t_w = 2.5;:
    parameter C_L = 0.05 ;        // 50pf

   //Counter
    integer counter;
    initial counter = 0;
    //assign #(tpd_min:tpd_max:tpd_max) Q = ;


    always@(posedge CLK) begin
        if (CLR_BAR != 0)
            Q <= D;
        else
            Q <= 0;
    end    

    always@(Q) begin
        counter += 1;
        $display("Potencia disipada en el Flip Flop: %f", counter * C_L * Vcc * Vcc );
    end
endmodule
