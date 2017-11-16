//-----------------------------------------------------
// Bryan Chan
// Project 2 - Nibble - Testbench
//-----------------------------------------------------
module testbench();

reg clk;
reg notReset;
reg [3:0] pushbuttons;
wire phase, notLoadA;
wire [1:0] flags;
wire [3:0] instr;
wire [3:0] operand;
wire [3:0] dataBus;
wire [3:0] ffOut;
wire [3:0] aPort;
wire [3:0] aluResult;
wire [7:0] programByte;
wire [11:0] address;
wire [11:0] addressCon;

Nibbler nibbler(
  .clk(clk),
  .notReset(notReset),
  .pushbuttons(pushbuttons),
  .phase(phase),
  .notLoadA(notLoadA),
  .flags(flags),
  .instr(instr),
  .operand(operand),
  .dataBus(dataBus),
  .ffOut(ffOut),
  .aPort(aPort),
  .aluResult(aluResult),
  .programByte(programByte),
  .address(address),
  .addressCon(addressCon)
);


  initial
    begin
      // Initial values
      {clk, notReset, pushbuttons} = 6'b000000;

      //Logging
      $display("phase\tnotReset\tpushbuttons\tnotLoadA\tcz\tinstr\toperand\taPort\taluResult\tdataBus\taccu\tprogramByte\tpc\t\taddressRam");
      $monitor("%b\t%b\t\t%b\t\t%b\t\t%b\t%b\t%b\t%b\t%b\t\t%b\t%b\t%b\t%d\t%b",phase,notReset,pushbuttons,notLoadA,flags,instr,operand,aPort,aluResult,dataBus,aPort,programByte,address,addressCon);

      // #2 {notReset} = 1'b0;
      #1 {notReset} = 1'b1;
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
    #35 $finish;
endmodule