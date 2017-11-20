/****************************************************************************************
*                                                                                       *
* https://www.bigmessowires.com/nibbler/                                                *
* Implementation by: Bryan Chan and Diego Regalado                                      *
*                                                                                       *
*****************************************************************************************/
module Microrom(
  input [3:0] instruction,
  input nC,
  input nZ,
  input ph,
  output incPC,
  output notLoadPC,
  output notLoadA,
  output notLoadFlags,
  output notCarryIn,
  output M,
  output [3:0] S,
  output notCsRam,
  output notWeRam,
  output notOeALU,
  output notOeIn,
  output notOeOprnd,
  output notLoadOut
);

assign incPC = ((~ph)|(instruction[1]&instruction[0])|(~instruction[3]&instruction[2]&instruction[1])|(~nZ&instruction[3]&~instruction[2]&instruction[0])|(~nC&~instruction[3]&~instruction[2]&instruction[0])|(nZ&instruction[3]&~instruction[2]&~instruction[1]&~instruction[0])|(nC&~instruction[3]&~instruction[2]&~instruction[1]&~instruction[0]));
assign notLoadPC = ((~ph)|(instruction[1])|(~instruction[3]&instruction[2])|(instruction[2]&instruction[0])|(~nZ&instruction[3]&instruction[0])|(~nC&~instruction[3]&instruction[0])|(nC&~instruction[3]&~instruction[0])|(nZ&instruction[3]&~instruction[2]&~instruction[0]));
assign notLoadA = ((~ph)|(~instruction[3]&~instruction[2])|(instruction[3]&~instruction[1])|(~instruction[3]&instruction[1]&instruction[0]));
assign notLoadFlags = ((~ph)|(instruction[3]&~instruction[1])|(~instruction[2]&~instruction[1])|(~instruction[3]&instruction[2]&instruction[1]&instruction[0]));
assign notCarryIn = ((~ph)|(instruction[3])|(instruction[2])|(~instruction[1]));
assign M = ((ph&instruction[3]&instruction[2]&instruction[1])|(ph&~instruction[3]&instruction[2]&~instruction[1])|(ph&instruction[2]&instruction[1]&~instruction[0]));
assign S[3] = ((ph&instruction[3]&~instruction[2]&instruction[1])|(ph&~instruction[3]&instruction[2]&~instruction[1])|(ph&~instruction[3]&instruction[2]&~instruction[0]));
assign S[2] = ((ph&~instruction[3]&~instruction[2]&instruction[1]));
assign S[1] = ((ph&~instruction[3]&~instruction[2]&instruction[1])|(ph&~instruction[3]&instruction[2]&~instruction[1])|(ph&~instruction[3]&instruction[1]&~instruction[0]));
assign S[0] = ((ph&instruction[3]&instruction[1]));
assign notCsRam = ((~ph)|(~instruction[1])|(instruction[3]&~instruction[0])|(~instruction[2]&~instruction[0]));
assign notWeRam = ((~ph)|(instruction[3])|(~instruction[2])|(~instruction[1])|(~instruction[0]));
assign notOeALU = ((ph&instruction[3]&instruction[1])|(ph&~instruction[2]&instruction[1])|(ph&~instruction[3]&instruction[2]&~instruction[1])|(ph&~instruction[3]&instruction[2]&~instruction[0]));
assign notOeIn = ((~ph)|(instruction[3])|(~instruction[2])|(instruction[1])|(~instruction[0]));
assign notOeOprnd = ((~ph)|(instruction[0])|(instruction[3]&~instruction[1])|(~instruction[2]&~instruction[1])|(~instruction[3]&instruction[2]&instruction[1]));
assign notLoadOut = ((~ph)|(~instruction[3])|(~instruction[2])|(instruction[1])|(~instruction[0]));

endmodule