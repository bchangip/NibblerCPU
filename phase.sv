// Phase
module Phase(
  input reset,
  input clk,
  output phaseOut
);

reg phaseOut = 0;

always @ ( posedge clk) begin
	if(reset) begin
		phaseOut = 0;
	end else begin
		phaseOut = ~phaseOut;
	end
end

endmodule