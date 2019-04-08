`include "not.v"
`include "nand.v"
`include "nor.v"
`include "flip-flop.v"

  /** 
  * Custom Demux 1:2 1-bit.
  * Based on the components defined by the included .v files
  * Use @ Vcc = 5V 
  **/


module demux_1to2(   input clk, reset_L, data_in,
                output wire data_out0, data_out1);
   
   
    //selector (using internal signal)
    reg s = 'b0;
    
    //wires to connect to other gates
    wire data_after_reset_L, s_n, out0_before_inv, out1_before_inv;
    
    
    //instantiated gates
    nandG   nandRST(data_in, reset_L , data_after_reset_L);
    notG    sneg(s, s_n);
    nandG   nand0(data_in, s, out0);
    nandG   nand1(data_in, s_n, out1);
    notG    data_out_neg_0(out0_before_inv, data_out0);
    notG    data_out_neg_1(out1_before_inv, data_out1);
endmodule    
