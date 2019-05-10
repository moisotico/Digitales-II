`timescale  1ns / 100ps
`include "src/probador.v"
`include "src/demux_valid.v"
`include "lib/cmos_cells.v"

module TestBench;                               

   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			clk;			// From probador of probador.v
   wire [3:0]		data_in;		// From probador of probador.v
   wire [3:0]		data_out0;		// From dmux of demux_valid.v
   wire [3:0]		data_out1;		// From dmux of demux_valid.v
   wire [3:0]		data_tran;		// From dmux of demux_valid.v
   wire			reset_L;		// From probador of probador.v
   wire			valid_in;		// From probador of probador.v
   wire			valid_out0;		// From dmux of demux_valid.v
   wire			valid_out1;		// From dmux of demux_valid.v
   // End of automatics
   /*AUTOREGINPUT*/    

   demux_valid dmux (/*AUTOINST*/
		     // Outputs
		     .data_tran		(data_tran[3:0]),
		     .data_out0		(data_out0[3:0]),
		     .data_out1		(data_out1[3:0]),
		     .valid_out0	(valid_out0),
		     .valid_out1	(valid_out1),
		     // Inputs
		     .clk		(clk),
		     .reset_L		(reset_L),
		     .valid_in		(valid_in),
		     .data_in		(data_in[3:0]));
   

   probador probador (/*AUTOINST*/
		      // Outputs
		      .clk		(clk),
		      .reset_L		(reset_L),
		      .valid_in		(valid_in),
		      .data_in		(data_in[3:0]),
		      // Inputs
		      .data_out0	(data_out0[3:0]),
		      .data_out1	(data_out1[3:0]),
		      .data_tran	(data_tran[3:0]),
		      .valid_out0	(valid_out0),
		      .valid_out1	(valid_out1));
endmodule
