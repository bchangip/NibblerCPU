//-----------------------------------------------------
// Bryan Chan
// Project 2 - Nibble - Testbench
//-----------------------------------------------------
module testbench();

  reg [3:0] dataIn;
  reg enable;
  wire [3:0] dataOut;

  QuadTristate quadTristate(dataIn, enable, dataOut);

  initial
    begin
      // Initial values
      {dataIn, enable} = 5'b00001;

      //Logging
      $display("Time\tData\tEnable");
      $monitor("%d\t %b\t%b\t%b", $time, dataIn, enable, dataOut);

      #2 {dataIn, enable} = 5'b00111;
      #2 {dataIn, enable} = 5'b11001;
      #2 {dataIn, enable} = 5'b11000;


    end

  /**********************************************************/
  /*	CLOCK										                          		*/
  /*                                          							*/
  /**********************************************************/

  // Clock
  // always
  //   #1 clk = ~clk;

  /**********************************************************/
  /*	CLOCK 									                        			*/
  /*                                           							*/
  /**********************************************************/
 
  //Finish simulation
  initial 
    #25 $finish;
endmodule