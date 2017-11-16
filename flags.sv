// Phase
module Flags(
  input c,
  input z,
  input notReset,
  input clk,
  output [1:0] flagsOut
);

reg flagsOut = 2'b0;

always @ (posedge clk) begin
	if(~notReset) begin
		{flagsOut} = 2'b0;
	end else begin
		{flagsOut} = {c,z};
	end
end

endmodule