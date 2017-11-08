// ALU
module ALU(
  input carryIn,
  input mode,
  input [3:0] func,
  input [3:0] aPort,
  input [3:0] bPort,
  output [3:0] dataOut,
  output carryOut
);

reg [3:0] dataOut = 0;
reg carryOut = 0;

case({carryIn, mode, func})
	6'b100000:
		begin
			$display("FIRST");
		end
	6'b000110:
		begin
		end
	6'bx11010:
		begin
		end
	6'b101001:
		begin
		end
	6'bx10001:
		begin
		end

endmodule