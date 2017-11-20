/****************************************************************************************
*                                                                                       *
* https://www.bigmessowires.com/nibbler/                                                *
* Implementation by: Bryan Chan and Diego Regalado                                      *
*                                                                                       *
*****************************************************************************************/
module testbench();

  reg data;
  reg reset;
  reg clk;
  wire out;

  DFlipFlop flip(data, clk, reset, out);

  initial
    begin
      // Initial values
      {data, reset, clk} = 3'b0;

      //Logging
      $display("Time\tD\tQ");
      $monitor("%d\t %b\t %b \t %b", $time, clk, data, out);

      #2 data = 1;
      #4 data = 0;
      #2 data = 1;
      #2 data = 0;
    end

  /**********************************************************/
  /*	CLOCK										                          		*/
  /*                                          							*/
  /**********************************************************/

  // Clock
  always
    #1 clk = ~clk;

  /**********************************************************/
  /*	CLOCK 									                        			*/
  /*                                           							*/
  /**********************************************************/
 
  //Finish simulation
  initial 
    #15 $finish;
endmodule