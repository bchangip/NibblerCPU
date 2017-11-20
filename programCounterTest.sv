/****************************************************************************************
*                                                                                       *
* https://www.bigmessowires.com/nibbler/                                                *
* Implementation by: Bryan Chan and Diego Regalado                                      *
*                                                                                       *
*****************************************************************************************/
module testbench();

  reg [11:0] addressIn;
  reg incPC;
  reg notReset;
  reg notLoadPC;
  reg clk;
  wire [11:0] addressOut;

  ProgramCounter pc(addressIn, incPC, notReset, notLoadPC, clk, addressOut);

  initial
    begin
      // Initial values
      {addressIn, incPC, notReset, notLoadPC, clk} = 16'b0000000000001010;

      //Logging
      $display("Time\tD\tQ");
      $monitor("%d\t %b\t%b\t%b\t%b\t%b\t%b", $time, clk, addressIn, incPC, notReset, notLoadPC, addressOut);

      #2 {addressIn, incPC, notReset, notLoadPC} = 16'b000000000000111;
      #10 {addressIn, incPC, notReset, notLoadPC} = 16'b101010101010010;
      #2 {addressIn, incPC, notReset, notLoadPC} = 16'b000000000000111;
      #5 {addressIn, incPC, notReset, notLoadPC} = 16'b000000000000001;
      #2 {addressIn, incPC, notReset, notLoadPC} = 16'b000000000000111;

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