module probador( //testbench: signal generator and data monitor
                    input [3:0]	data_out0, data_out1, data_tran,		// From demux1_2 of demux.v
                    output reg clk,
                    output reg reset_L,			                // To demux1_2 of demux.v
                    output reg valid_in,
                    output reg [3:0] data_in,
                    input valid_out0, valid_out1
                    );
 
   initial
     begin
      $dumpfile("demux_1x2.vcd");               //Dumpfile to make in current folder 
      $dumpvars;                                //Directive to "dump" variables  
         
         valid_in<= 0;                      
         reset_L <= 'b0;
         @(posedge clk);
            reset_L <= 1;                          //set reset to 1 to start the demux
            valid_in <= 1;
         
         repeat(10)begin                        //run valid as 0 for the first 10 cycles
             @(posedge clk);
                valid_in <= 0;  
         end

         repeat(20)begin                        //run valid for the next 20 cycles
             @(posedge clk);
                valid_in <= 1;  
         end

         repeat(5)begin
          reset_L <= 0;
         end
         
         @(posedge clk);
         reset_L <='b0;
         $finish;                               //finishes storing variables 
     end
    
    always  #2 clk  <= ~clk;                    //"Toggle" each 2*10ns
    always  #10 data_in <= $random % 16;
    initial clk <= 0;
    initial data_in <= 'b0;
    //initial valid_in <= 'b0;

endmodule
