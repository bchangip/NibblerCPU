//-----------------------------------------------------
// Bryan Chan
// Project 2 - Nibble - Testbench
//-----------------------------------------------------
module testbench();

  reg [7:0] programByte;
  reg clk;
  reg phase;
  reg reset;
  wire [3:0] instruction;
  wire [3:0] operand;

  Fetch fetch(programByte, clk, phase, reset, instruction, operand);

  initial
    begin
      // Initial values
      {programByte, clk, phase, reset} = 11'b00000000001;

      //Logging
      $display("time\tclk\tphase\treset\tprogramByte\tinstruction\toperand");
      $monitor("%d\t%b\t%b\t%b\t%b\t%b\t%b", $time, clk, phase, reset, programByte, instruction, operand);

      #2 {reset} = 1'b0;
      #2 {programByte} = 8'b00000000;
      #2 {programByte} = 8'b00001111;
      #2 {phase} = 1'b1;
      #2 {programByte} = 8'b11110000;
      #2 {programByte} = 8'b00111100;


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