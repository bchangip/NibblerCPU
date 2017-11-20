/****************************************************************************************
*                                                                                       *
* https://www.bigmessowires.com/nibbler/                                                *
* Implementation by: Bryan Chan and Diego Regalado                                      *
*                                                                                       *
*****************************************************************************************/
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
    
  //Finish simulation
  initial 
    #25 $finish;
endmodule