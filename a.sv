// A
module A(
  input [3:0] dataIn,
  input reset,
  input clk,
  output [3:0] dataOut
);

reg dataOut = 0;

always @ ( posedge clk) begin
	if(reset) begin
		{dataOut} = 4'b0;
	end else begin
		{dataOut} = {dataIn};
	end
end

endmodule