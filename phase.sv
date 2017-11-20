/****************************************************************************************
*																						*
* https://www.bigmessowires.com/nibbler/												*
* Implementation by: Bryan Chan and Diego Regalado										*
*																						*
*****************************************************************************************/
module Phase(
  input notReset,
  input clk,
  output phaseOut
);

reg phaseOut;

always @ ( posedge clk or posedge ~notReset) begin
	if(~notReset) begin
		phaseOut = 0;
	end else begin
		phaseOut = ~phaseOut;
	end
end

endmodule