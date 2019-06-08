module contador_gray_cond(
                input               clk,
                input               enable,
                input               reset_L,
                output reg  [4:0]   salida_gray );

    //Counter with an extra bit
    reg [4:0] counter;

    //SIZE: amount counted before it resets
    parameter SIZE = 32;

    always@(posedge clk)begin

        //resets the main 5 {0 to 4} bits
        if( !reset_L )begin
               counter<= 'b0;
        end else if (enable) begin
           //toggle pendiente
            if(counter < (SIZE -1) )begin
                counter <= counter + 1;
            end else begin
                counter <= 'b0;
            end
        end
    end

    always@(*)begin
        salida_gray = counter ^ (counter >> 1);        // return num ^ (num >> 1);
    end
endmodule
