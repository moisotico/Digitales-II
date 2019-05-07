`timescale  1ns / 100ps
`include "./src/probador.v"
`include "./src/demux_comb.v"
`include "./lib/cmos_cells.v"

module TestBench;                               //testbench doesn't have ports

    /*AUTOWIRE*/
    // Beginning of automatic wires (for undeclared instantiated-module outputs)
    wire		clk;			// From probador of probador.v
    wire [3:0]		data_in;		// From probador of probador.v
    wire [3:0]		data_out0;		// From dmux of demux.v
    wire [3:0]		data_out1;		// From dmux of demux.v
    wire		reset_L;		// From probador of probador.v
    // End of automatics
   /*AUTOREGINPUT*/

    demux dmux (/*AUTOINST*/
		// Outputs
		.data_out0		(data_out0[3:0]),
		.data_out1		(data_out1[3:0]),
		// Inputs
		.clk			(clk),
		.reset_L		(reset_L),
		.data_in		(data_in[3:0]));

    probador probador (/*AUTOINST*/
		       // Outputs
		       .clk		(clk),
		       .reset_L		(reset_L),
		       .data_in		(data_in[3:0]),
		       // Inputs
		       .data_out0	(data_out0[3:0]),
		       .data_out1	(data_out1[3:0]));
endmodule
