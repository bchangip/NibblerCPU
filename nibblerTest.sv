/****************************************************************************************
*                                                                                       *
* https://www.bigmessowires.com/nibbler/                                                *
* Implementation by: Bryan Chan and Diego Regalado                                      *
*                                                                                       *
*****************************************************************************************/
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
      $display("phase\taddress\tprogramByte\tinstr\toperand\taddressCon\tdataBus\taPort\tflags\tpushbuttons");
      $monitor("%b\t%d\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",phase, address, programByte, instr, operand, addressCon, dataBus, aPort, flags, pushbuttons);

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
    #500 $finish;
endmodule