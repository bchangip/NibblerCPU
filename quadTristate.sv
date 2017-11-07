// Tristate
module QuadTristate(
  input [3:0] dataIn,
  input enable,
  output [3:0] dataOut
);

assign dataOut = enable ? dataIn : 4'bz;

endmodule