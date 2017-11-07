// Program Counter
module ProgramCounter(
  input [11:0] addressIn,
  input incPC,
  input notReset,
  input notLoadPC,
  input clk,
  output [11:0] addressOut
);

reg [11:0] addressOut = 0;

always @ ( posedge clk) begin
	if(~notReset) begin
		addressOut = 12'b0;
	end else begin
		if(~notLoadPC) begin
			addressOut = addressIn;
		end else begin
			if(incPC) begin
				addressOut += 1;
			end else begin
				addressOut = addressOut;
			end
		end
	end
end

endmodule