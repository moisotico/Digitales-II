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

        //reset logic
        if (reset_L == 0) begin
            data_out0 = 0;
            data_out1 = 0;
            s = 0;
        end

        //demux logic 
        else begin                           //when reset_L is activated
            if (s==0) begin
                if (valid_in == 0) begin
                    data_out0 = 1'bz;   //valid_in logic
                end
                else begin
                    data_out0 = data_in;
                end
                data_out1 = 0;
                #5 s = ~s; 
            end     
            
            else begin                       // demux to data_out1
                data_out0 = 0;
                if (valid_in == 0) begin
                    data_out1 = 1'bz;   //valid_in logic
                end
                else begin
                    data_out1 = data_in;
                end
                #5 s = ~s; 
            end
        end
        
    end
    
endmodule
