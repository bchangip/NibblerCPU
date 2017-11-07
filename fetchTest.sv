//-----------------------------------------------------
// Bryan Chan
// Project 2 - Nibble - Testbench
//-----------------------------------------------------
module testbench();

  reg [7:0] programByte;
  reg clk;
  wire [3:0] instruction;
  wire [3:0] operand;

  Fetch fetch(programByte, clk, instruction, operand);

  initial
    begin
      // Initial values
      {programByte, clk} = 9'b000000000;

      //Logging
      $display("Time\tD\tQ");
      $monitor("%d\t %b\t%b\t%b\t%b", $time, clk, programByte, instruction, operand);

      #2 {programByte} = 8'b00000000;
      #2 {programByte} = 8'b00001111;
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