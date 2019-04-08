 `timescale 1ns/100ps
 
 /**
 * NOT gate
 * SN74LVC1GU04
 * http://www.ti.com/product/SN74LVC1GU04/description
 * Use @ 5V 
 **/


module notG(
    input a,
    output y
);
    //parameters from the datasheet

    parameter tpd_min = 1;
    parameter tpd_max = 3;
    parameter Vcc = 5;
    parameter C_L = 0.050;              //C_L = 50 pF
    integer counter = 0;

    wire a, y;                          //using combinational logic
    
    //Delay on gate
    assign #(tpd_min:tpd_max:tpd_max) y = ~a;  
    
    //Power for each iteration
    always@(y) begin
        counter += 1;
        $display("Potencia disipada en el Flip Flop: %f", counter * C_L * Vcc * Vcc );
    end
endmodule      
