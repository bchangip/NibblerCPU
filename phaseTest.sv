//-----------------------------------------------------
// Bryan Chan
// Project 2 - Nibble - Testbench
//-----------------------------------------------------
module testbench();

  reg reset;
  reg clk;
  wire phaseProbe;

  Phase phase(reset, clk, phaseProbe);

  initial
    begin
      // Initial values
      {reset, clk} = 2'b00;

      //Logging
      $display("Time\tReset\tPhase");
      $monitor("%d\t %b\t%b\t%b", $time, clk, reset, phaseProbe);

      #10 {reset} = 1;
      #10 {reset} = 0;


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