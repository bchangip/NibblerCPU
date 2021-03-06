/****************************************************************************************
*																						*
* https://www.bigmessowires.com/nibbler/												*
* Implementation by: Bryan Chan and Diego Regalado										*
*																						*
*****************************************************************************************/
module DFlipFlop(
  input D,
  input clk,
  input reset,
  output Q
);

reg Q;

always @ ( posedge clk) begin
	if(reset) begin
		Q = 0;
	end else begin
		Q = D;
	end
end

endmodule