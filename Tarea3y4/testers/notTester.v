
`include "../modules/not.v"
`timescale 1ns/1ps
module probadorNot;
    reg a;
    wire y;
    realtime start, finish, delta_sf;

    initial begin
        $dumpfile("notGate.vcd");                   //Dumpfile to make in current folder
        $dumpvars;                                  //Directive to "dump" variables
    end
        
    initial begin

        $display("<<<<Test for the not gate>>>>");
       
        // test 1: 0 to 1
        #0 start = $realtime;
        #100 a = 0 ;
        #0 finish = $realtime;
        $display("Test for 0 => 1");
        
        // test 2: 1 to 0
        # 0 start = $realtime;
        # 1000 a = 1'bx;
        # 0 finish = $realtime;
        $display("Test for 1 => 0");


        delta_sf = start - finish;
        $display ("start time: %d", start);
        $display ("ending time: %d", finish);
        $display ("delta_sf: %d", delta_sf);
        
        # 1000 $finish;
    end
    not notGate1 (.a(a),.y(y));
endmodule
