`timescale  1ns / 100ps
`include "demux_1to2.v"
`include "demux_tester_1-bit.v"

module TestBench;                               //testbench doesn't have ports

    /*AUTOWIRE*/
   /*AUTOREGINPUT*/

    demux_1to2 dmux1(/*AUTOINST*/
		     // Outputs
		     .data_out0		(data_out0),
		     .data_out1		(data_out1),
		     // Inputs
		     .clk		(clk),
		     .reset_L		(reset_L),
		     .data_in		(data_in));


    probador_demux_1_bit probador_demux_1_bit (/*AUTOINST*/
                    // Outputs
                    .clk     (clk),
                    .reset_L     (reset_L),
                    .data_in     (data_in),
                    // Inputs
                    .data_out0   (data_out0),
                    .data_out1   (data_out1));
endmodule
