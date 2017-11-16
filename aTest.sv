//-----------------------------------------------------
// Bryan Chan
// Project 2 - Nibble - Testbench
//-----------------------------------------------------
module testbench();

  reg [3:0] dataIn;
  reg reset;
  reg clk;
  reg enable;
  wire [3:0] dataOut;

  A a(dataIn, reset, clk, enable, dataOut);

  initial
    begin
      // Initial values
      {dataIn, reset, clk, enable} = 7'b0;

      //Logging
      $display("Time\tClock\tEnable\tDataIn\tReset\tDataOut");
      $monitor("%d\t %b\t%b\t%b\t%b\t%b", $time, clk, enable, dataIn, reset, dataOut);

      #2 {dataIn, reset} = 5'b00010;
      #2 {dataIn, reset} = 5'b00110;
      #2 {dataIn, reset} = 5'b11000;
      #2 {enable} = 1'b1;
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