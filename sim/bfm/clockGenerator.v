`timescale 1ns/1ps

module clockGenerator(
  output reg clk128,
  output reg clk125,
  output reg miiTxClk,
  output reg miiRxClk,
  output reg reset);

initial
begin
    clk128 = 0;
	clk125 = 0;
    miiTxClk = 0;
    miiRxClk = 1;
    reset = 0;
    #100
    reset = 1;
    #100
    reset = 0;
end

task RESET;
begin

    reset = 1'b0;
    #100
    reset = 1'b1;
    #100
    reset = 1'b0;

end
endtask


always #6 clk128 = ~clk128;
always #4 clk125 = ~clk125;
always #20 miiTxClk = ~miiTxClk;
always #20 miiRxClk = ~miiRxClk;

endmodule
