//-----------------------------------------------------
// Bryan Chan
// Project 2 - Nibble - Testbench
//-----------------------------------------------------
module testbench();

  reg notCarryIn;
  reg mode;
  reg [3:0] func;
  reg [3:0] aPort;
  reg [3:0] bPort;
  wire [3:0] dataOut;
  wire carryOut;
  wire zeroOut;

  ALU alu(notCarryIn,mode,func,aPort,bPort,dataOut,carryOut, zeroOut);

  initial
    begin
      // Initial values
      {aPort, bPort} = 8'b00110111;

      //Logging
      $display("notCarryIn\tmode\tfunc\taPort\tbPort\tdataOut\tcarryOut\tzeroOut");
      $monitor("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b", notCarryIn,mode,func,aPort,bPort,dataOut,carryOut,zeroOut);

      #1 $display("A Passthrough");
      #1 {notCarryIn,mode,func} = 6'b100000;
      #1 $display("B Passthrough");
      #1 {notCarryIn,mode,func} = 6'b111010;
      #1 $display("A COMPARE B (Arithmetic)");
      #1 {notCarryIn,mode,func} = 6'b000110;
      #1 $display("A + B (Arithmetic)");
      #1 {notCarryIn,mode,func} = 6'b101001;
      #1 $display("A NOR B");
      #1 {notCarryIn,mode,func} = 6'b110001;
    end

  //Finish simulation
  initial 
    #25 $finish;
endmodule