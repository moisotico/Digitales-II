//verilog module for a 1:2 demux with valid for in and out
module demux_valid(
                    input clk, reset_L, valid_in,
                    output reg [3:0] data_tran, data_out0, data_out1,
                    input [3:0] data_in,
                    output reg valid_out0, valid_out1                   );

    //selector (using internal signal)
    reg s;

    //using non-blocking asignation on positive edge    
    always@(posedge clk)
    begin
    #5 s <= ~s; 
        case (valid_in)
            0: begin
                data_tran <= data_tran;  //previous data_in 
            end

            1: begin
                data_tran <= data_in;    //data_in is valid
            end
        endcase
    end
   
    //using combinational logic
    always@(*)
    begin
        data_out0 = 0;
        data_out1 = 0;
        data_tran = data_in;
        valid_out0 = 'b0;
        valid_out1 = 'b0;
        
        //reset logic
        if (reset_L == 0) begin
            data_out0 = 0;
            data_out1 = 0;
            valid_out0 = 'b0;
            valid_out1 = 'b0;
            s = 0;
        end

        //demux logic 
        else begin                           //when reset_L is activated
            if (s==0) begin
                data_out0 = data_tran;
                //data_out1 = 0;
                valid_out0 = valid_in;       //valid_out0 active
                //valid_out1 = 0;
                
            end     
            
            else begin                       // demux to data_out1
                //data_out0 = 0;
                data_out1 = data_tran;         //valid_out1 active
                //valid_out0 = 0;
                valid_out1 = valid_in;
            end
        end 
    end
    
endmodule
