// Phase
module Flags(
  input c,
  input z,
  input reset,
  input clk,
  output [1:0] flagsOut
);

reg flagsOut = 0;

always @ ( posedge clk) begin
	if(reset) begin
		{flagsOut} = 2'b0;
	end else begin
		{flagsOut} = {c,z};
	end
end

endmodule