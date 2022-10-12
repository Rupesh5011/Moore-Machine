`timescale 1ns / 1ps


module cyclic_lamp_tb;
    reg clk;
    wire [0:2] light;

    cyclic_lamp DUT ( clk, light);

    always #5 clk = ~clk;
    initial
        begin
            clk = 1'b0;
            #100 $finish;
        end

    initial
        begin
            $dumpfile ("cyclic.vcd"); $dumpvars( 0, cyclic_lamp_tb);
            $monitor ($time, " RGY: %b", light);
        end

endmodule
