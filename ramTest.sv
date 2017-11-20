/****************************************************************************************
*                                                                                       *
* https://www.bigmessowires.com/nibbler/                                                *
* Implementation by: Bryan Chan and Diego Regalado                                      *
*                                                                                       *
*****************************************************************************************/
module testbench();

  reg [11:0] address;
  reg notChipEnable;
  reg notWriteEnable;
  wire [3:0] io;
  reg [3:0] iobuffer;

  assign io = (~notWriteEnable) ? iobuffer : 4'bzzzz;
  Ram ram(address,notChipEnable,notWriteEnable,io);

  initial
    begin
      // Initial values
      notWriteEnable = 0;

      //Logging
      $display("address\tnotChipEnable\tnotWriteEnable\tio");
      $monitor("%b\t%b\t%b\t%b", address,notChipEnable,notWriteEnable,io);

      #1 $display("\n\nCHIP ENABLED");
      #1 $display("WRITING SECTION");
      #1 {address,notChipEnable,notWriteEnable,iobuffer} = 18'b000000000000000011;
      #1 {address,notChipEnable,notWriteEnable,iobuffer} = 18'b000000000001001100;
      #1 {address,notChipEnable,notWriteEnable,iobuffer} = 18'b000000000010000110;
      #1 {address,notChipEnable,notWriteEnable,iobuffer} = 18'b111101111011001001;
      #1 $display("\nREADING SECTION");
      #1 {address,notChipEnable,notWriteEnable} = 14'b00000000001001;
      #1 {address,notChipEnable,notWriteEnable} = 14'b11110111101101;
      #1 {address,notChipEnable,notWriteEnable} = 14'b00000000000001;
      #1 {address,notChipEnable,notWriteEnable} = 14'b00000000000101;

      #1 $display("\n\nCHIP DISABLED");
      #1 $display("WRITING SECTION");
      #1 {address,notChipEnable,notWriteEnable,iobuffer} = 18'b000000000000100011;
      #1 {address,notChipEnable,notWriteEnable,iobuffer} = 18'b000000000001101100;
      #1 {address,notChipEnable,notWriteEnable,iobuffer} = 18'b000000000010100110;
      #1 {address,notChipEnable,notWriteEnable,iobuffer} = 18'b111101111011101001;
      #1 $display("\nREADING SECTION");
      #1 {address,notChipEnable,notWriteEnable} = 14'b00000000001011;
      #1 {address,notChipEnable,notWriteEnable} = 14'b11110111101111;
      #1 {address,notChipEnable,notWriteEnable} = 14'b00000000000011;
      #1 {address,notChipEnable,notWriteEnable} = 14'b00000000000111;

    end
  //Finish simulation
  initial 
    #25 $finish;
endmodule