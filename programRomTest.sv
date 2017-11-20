/****************************************************************************************
*                                                                                       *
* https://www.bigmessowires.com/nibbler/                                                *
* Implementation by: Bryan Chan and Diego Regalado                                      *
*                                                                                       *
*****************************************************************************************/
module testbench();
  //Finish simulation
  reg [11:0] address;
  wire [7:0] data;

  Rom rom(address, data);

  initial
    begin
      // Initial values
      {address} = 12'b000000000000;

      //Logging
      $display("address - data");
      $monitor("%b \t %b", address, data);

      #1 {address} = 12'b000000000001;
      #1 {address} = 12'b000000000010;
      #1 {address} = 12'b000000000011;
      #1 {address} = 12'b000000000100;
    end

  initial 
    #100 $finish;
endmodule