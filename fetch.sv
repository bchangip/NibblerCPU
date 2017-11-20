/****************************************************************************************
*																						*
* https://www.bigmessowires.com/nibbler/												*
* Implementation by: Bryan Chan and Diego Regalado										*
*																						*
*****************************************************************************************/
module Fetch(
  input [7:0] programByte,
  input clk,
  input phase,
  input notReset,
  output [3:0] instr,
  output [3:0] operand
);

reg [3:0] instr = 0;
reg [3:0] operand = 0;

always @ (posedge clk) begin
	if(~notReset) begin
		{instr, operand} = 8'b0;
	end else begin
		if(phase) begin
			{instr, operand} = programByte;
		end else begin
			{instr, operand} = {instr, operand};
		end
	end
end

endmodule