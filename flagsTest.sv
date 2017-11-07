//-----------------------------------------------------
// Bryan Chan
// Project 2 - Nibble - Testbench
//-----------------------------------------------------
module testbench();

  reg c;
  reg z;
  reg reset;
  reg clk;
  wire [1:0] flagsOut;

  Flags flags(c, z, reset, clk, flagsOut);

  initial
    begin
      // Initial values
      {c, z, reset, clk} = 4'b0;

      //Logging
      $display("Time\tClock\tC\tZ\tReset\tFlags");
      $monitor("%d\t %b\t%b\t%b\t%b\t%b", $time, clk, c, z, reset, flagsOut);

      #2 {c, z, reset} = 3'b000;
      #2 {c, z, reset} = 3'b100;
      #2 {c, z, reset} = 3'b010;
      #2 {c, z, reset} = 3'b110;
      #2 {c, z, reset} = 3'b000;



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
    #25 $finish;
endmodule