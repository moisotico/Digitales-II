//verilog module for a 1:2 demux
module demux(
                    input clk, reset_L,
                    output reg [3:0] data_out0, data_out1,
                    input [3:0] data_in );

    //selector (using internal signal)
    reg s;

    //using non-blocking asignation on positive edge    
   
        
    always@(posedge clk) begin
        if (reset_L == 0)
        begin
            data_out0 <= 0;
            data_out1 <= 0;
            s <= 0;
        end
       
        else                            //when reset_L is activated
        begin
            if (s==0) 
            begin
                data_out0 <= data_in;
                data_out1 <= 0;
                #10 s <= ~s; 
            end

            // demux to data_out1
            else
            begin
                data_out0 <= 0;
                data_out1 <= data_in;
                #10 s <= ~s; 
            end
        end
    end
    
endmodule
