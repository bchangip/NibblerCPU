// Fetch
module Fetch(
  input [7:0] programByte,
  input clk,
  input phase,
  input notReset,
  output [3:0] instr,
  output [3:0] operand
);

//Should enable on phase 0

reg [3:0] instr = 0;
reg [3:0] operand = 0;

always @ (posedge clk) begin
	// $display("On fetch");
	if(~notReset) begin
		// $display("On reset");
		{instr, operand} = 8'b0;
	end else begin
		// $display("Outside reset");
		if(phase) begin
			// $display("Updating instr and opr");
			{instr, operand} = programByte;
		end else begin
			// $display("Staying as before");
			{instr, operand} = {instr, operand};
		end
	end
end

endmodule