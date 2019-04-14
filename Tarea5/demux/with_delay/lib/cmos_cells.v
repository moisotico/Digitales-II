//https://www.mouser.com/new/Texas-Instruments/ti-sn74aup1g126-buffer-gates/
//SN74AUP1G126 Low-Power Single Bus Buffer Gates
module BUF(A, Y);
input A;
output Y;
assign #(0.15:0.48:0.48) Y = A;
endmodule

//NOT gate SN74LVC1GU04
//http://www.ti.com/product/SN74LVC1GU04/description
module NOT(A, Y);
input A;
output Y;
assign #(0.1:0.3:0.3) Y = ~A;
endmodule

//NAND Gate SN74LVC1G00
//http://www.ti.com/product/SN74LVC1G00/description?keyMatch=nand&tisearch=Search-EN-Everything
module NAND(A, B, Y);
input A, B;
output Y;
assign #(0.1:0.45:0.45) Y = ~(A & B);
endmodule

//NOR gate SN74LVC1G02
//http://www.ti.com/product/SN74LVC1G02/description
module NOR(A, B, Y);
input A, B;
output Y;
assign #(0.1:0.35:0.35) Y = ~(A | B);
endmodule

// Flip-Flop SN74LVC1G175
// http://www.ti.com/product/SN74LVC1G175/description
module DFF(C, D, Q);
input C, D;
output reg Q;
always @(posedge C)
#(0.5:0.7:0.7) Q <= D;
endmodule

//Flip-Flop + Set and Reset signals, just use same values as DFF
module DFFSR(C, D, Q, S, R);
input C, D, S, R;
output reg Q;
always @(posedge C, posedge S, posedge R)
	if (S)
#(0.5:0.7:0.7) 	Q <= 1'b1;
	else if (R)
#(0.5:0.7:0.7) 	Q <= 1'b0;
	else
#(0.5:0.7:0.7) Q <= D;
endmodule
