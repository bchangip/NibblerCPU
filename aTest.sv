//-----------------------------------------------------
// Bryan Chan
// Project 2 - Nibble - Testbench
//-----------------------------------------------------
module testbench();

  reg [3:0] dataIn;
  reg reset;
  reg clk;
  wire [3:0] dataOut;

  A a(dataIn, reset, clk, dataOut);

  initial
    begin
      // Initial values
      {dataIn, reset, clk} = 6'b0;

      //Logging
      $display("Time\tClock\tDataIn\tReset\tDataOut");
      $monitor("%d\t %b\t%b\t%b\t%b", $time, clk, dataIn, reset, dataOut);

      #2 {dataIn, reset} = 5'b00010;
      #2 {dataIn, reset} = 5'b00110;
      #2 {dataIn, reset} = 5'b11000;
      #2 {dataIn, reset} = 5'b01100;
      #2 {dataIn, reset} = 5'b10010;
      #2 {dataIn, reset} = 5'b00001;
      #2 {dataIn, reset} = 5'b00000;
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