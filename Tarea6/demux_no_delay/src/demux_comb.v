//verilog module for a 1:2 demux with valid for in and out
module demux(
                    input clk, reset_L, valid_in,
                    output reg [3:0] data_out0, data_out1,
                    input [3:0] data_in,
                    input [1:0] valid_out                   );

    //selector (using internal signal)
    reg s;

    //using non-blocking asignation on positive edge    
    always@(*) begin
        //valid logic
        //b = (enable) ? a : 1'bz;

        //reset logic
        if (reset_L == 0) begin
            data_out0 = 0;
            data_out1 = 0;
            s = 0;
        end

        //demux logic 
        else begin                           //when reset_L is activated
            if (s==0) begin
                data_out0 = data_in;
                data_out1 = 0;
                #5 s = ~s; 
            end

            else begin                       // demux to data_out1
                data_out0 = 0;
                data_out1 = data_in;
                #5 s = ~s; 
            end
        end
        
    end
    
endmodule
