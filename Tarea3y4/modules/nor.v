`timescale 1ns/100ps

/**
* NOR gate
* SN74LVC1G02
* http://www.ti.com/product/SN74LVC1G02/description?keyMatch=Single%202%20Input%20Positive%20nor%20gate&tisearch=Search-EN-Everything
* Used @ 5V
**/


module norG (
    input a,
    input b,      
    output y 
);
    wire a, b, y;
    
    parameter tpd_min = 1 ;
    parameter tpd_max = 4.5; 
    parameter Vcc = 5;

    assign #(tpd_min:tpd_max:tpd_max) y = !(a | b);
endmodule
