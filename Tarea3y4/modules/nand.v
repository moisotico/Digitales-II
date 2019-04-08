`timescale 1ns/100ps

/**
* NAND gate
* SN74LVC1G00
* http://www.ti.com/product/SN74LVC1G00/description?keyMatch=nand&tisearch=Search-EN-Everything
* Use @ 5V 
**/


module nandG(
    input a,              
    input b,              
    output y              
);
    //parameters from the datasheet
    parameter tpd_min = 1;
    parameter tpd_max = 4.3;
    parameter Vcc = 5;
    parameter C_L = 0.015;          //C_L= 15 pF 
    integer counter = 0;

    wire a, b, y;                   //using combinational logic 
    
    //Delay on gate
    assign #(tpd_min:tpd_max:tpd_max) y = !(a & b);  
    
    //Power for each iteration
    always@(y) begin
        counter += 1;
        $display("Potencia disipada en el Flip Flop: %f", counter * C_L * Vcc * Vcc );
    end
endmodule    
