/* Generated by Yosys 0.7 (git sha1 61f6811, gcc 6.2.0-11ubuntu1 -O2 -fdebug-prefix-map=/build/yosys-OIL3SR/yosys-0.7=. -fstack-protector-strong -fPIC -Os) */

(* top =  1  *)
(* src = "src/demux.v:2" *)
module demux(clk, reset_L, data_out0, data_out1, data_in);
  (* src = "src/demux.v:13" *)
  wire [3:0] _00_;
  (* src = "src/demux.v:13" *)
  wire [3:0] _01_;
  (* src = "src/demux.v:13" *)
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  (* src = "src/demux.v:3" *)
  input clk;
  (* src = "src/demux.v:5" *)
  input [3:0] data_in;
  (* src = "src/demux.v:4" *)
  output [3:0] data_out0;
  (* src = "src/demux.v:4" *)
  output [3:0] data_out1;
  (* src = "src/demux.v:3" *)
  input reset_L;
  (* src = "src/demux.v:8" *)
  wire s;
  NAND _11_ (
    .A(reset_L),
    .B(s),
    .Y(_04_)
  );
  NOR _12_ (
    .A(_04_),
    .B(_03_),
    .Y(_01_[0])
  );
  NOT _13_ (
    .A(data_in[1]),
    .Y(_05_)
  );
  NOR _14_ (
    .A(_04_),
    .B(_05_),
    .Y(_01_[1])
  );
  NOT _15_ (
    .A(data_in[2]),
    .Y(_06_)
  );
  NOR _16_ (
    .A(_04_),
    .B(_06_),
    .Y(_01_[2])
  );
  NOT _17_ (
    .A(data_in[3]),
    .Y(_07_)
  );
  NOR _18_ (
    .A(_04_),
    .B(_07_),
    .Y(_01_[3])
  );
  NOT _19_ (
    .A(s),
    .Y(_08_)
  );
  NAND _20_ (
    .A(reset_L),
    .B(_08_),
    .Y(_09_)
  );
  NOR _21_ (
    .A(_09_),
    .B(_03_),
    .Y(_00_[0])
  );
  NOR _22_ (
    .A(_09_),
    .B(_05_),
    .Y(_00_[1])
  );
  NOR _23_ (
    .A(_09_),
    .B(_06_),
    .Y(_00_[2])
  );
  NOR _24_ (
    .A(_09_),
    .B(_07_),
    .Y(_00_[3])
  );
  NOT _25_ (
    .A(reset_L),
    .Y(_10_)
  );
  NOR _26_ (
    .A(_10_),
    .B(s),
    .Y(_02_)
  );
  NOT _27_ (
    .A(data_in[0]),
    .Y(_03_)
  );
  DFF _28_ (
    .C(clk),
    .D(_00_[0]),
    .Q(data_out0[0])
  );
  DFF _29_ (
    .C(clk),
    .D(_00_[1]),
    .Q(data_out0[1])
  );
  DFF _30_ (
    .C(clk),
    .D(_00_[2]),
    .Q(data_out0[2])
  );
  DFF _31_ (
    .C(clk),
    .D(_00_[3]),
    .Q(data_out0[3])
  );
  DFF _32_ (
    .C(clk),
    .D(_01_[0]),
    .Q(data_out1[0])
  );
  DFF _33_ (
    .C(clk),
    .D(_01_[1]),
    .Q(data_out1[1])
  );
  DFF _34_ (
    .C(clk),
    .D(_01_[2]),
    .Q(data_out1[2])
  );
  DFF _35_ (
    .C(clk),
    .D(_01_[3]),
    .Q(data_out1[3])
  );
  DFF _36_ (
    .C(clk),
    .D(_02_),
    .Q(s)
  );
endmodule