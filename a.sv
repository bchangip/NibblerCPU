// A
module A(
  input [3:0] dataIn,
  input notReset,
  input clk,
  input notLoadA,
  output [3:0] dataOut
);

reg dataOut = 0;

always @ ( posedge clk) begin
	if(~notReset) begin
		{dataOut} = 4'b0;
	end else begin
		if(~notLoadA) begin
			$display("Updating a");
			{dataOut} = {dataIn};
		end else begin
			{dataOut} = {dataOut};
		end
	end
end

endmodule