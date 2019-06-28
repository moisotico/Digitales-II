module probador_demux_1_bit( 
    input data_out0, data_out1,
    output reg clk, reset_L,  data_in);
    
    initial begin
    $dumpfile("demux_1bit.vcd");               //Dumpfile to make in current folder 
    $dumpvars;                                //Directive to "dump" variables  
    reset_L <= 'b0;
    @(posedge clk);
        reset_L <= 1;                          //set reset to 1 to start the demux
        
        repeat(12)begin                        //run for first 10 cycles of the clock
            @(posedge clk);
            data_in <= $random % 2;           //use $urandom or $random 
        end

        repeat(3)begin
            @(posedge clk);
            reset_L <= 0;
            data_in <= $random % 2;           //use $urandom or $random
        end
        
    @(posedge clk);
        reset_L <='b0;
        $finish;                               //finishes storing variables 

    end 
    always  #2 clk  <= ~clk;                    //"Toggle" each 2*10ns
    initial clk <= 0;
    initial data_in <= 'b0;

endmodule
