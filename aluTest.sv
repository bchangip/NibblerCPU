//-----------------------------------------------------
// Bryan Chan
// Project 2 - Nibble - Testbench
//-----------------------------------------------------
module testbench();

  reg carryIn;
  reg mode;
  reg [3:0] func;
  reg [3:0] aPort;
  reg [3:0] bPort;
  wire [3:0] dataOut;
  wire carryOut;

  ALU alu(carryIn,mode,func,aPort,bPort,dataOut,carryOut);

  initial
    begin
      // Initial values
      {aPort, bPort} = 8'b11000011;

      //Logging
      $display("carryIn\tmode\tfunc\taPort\tbPort\tdataOut\tcarryOut");
      $monitor("%b\t%b\t%b\t%b\t%b\t%b\t%b", carryIn,mode,func,aPort,bPort,dataOut,carryOut);

      #1 $display("A Passthrough");
      #1 {carryIn,mode,func} = 6'b100000;
      #1 $display("B Passthrough");
      #1 {carryIn,mode,func} = 6'b111010;
      #1 $display("A - B (Arithmetic)");
      #1 {carryIn,mode,func} = 6'b000110;
      #1 $display("A + B (Arithmetic)");
      #1 {carryIn,mode,func} = 6'b101001;
      #1 $display("A NOR B");
      #1 {carryIn,mode,func} = 6'b110001;
    end

  //Finish simulation
  initial 
    #25 $finish;
endmodule