// Fetch
module Fetch(
  input [7:0] programByte,
  input clk,
  output [3:0] instruction,
  output [3:0] operand
);

reg [3:0] instruction = 0;
reg [3:0] operand = 0;

always @ ( posedge clk) begin
	{instruction, operand} = programByte;
end

endmodule