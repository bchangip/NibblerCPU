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

always @ (carryIn or mode or func) begin
	casez({carryIn, mode, func})
		6'b100000: begin
			dataOut = aPort;
		end
		6'b000110: begin
			dataOut = aPort - bPort;
		end
		6'b?11010: begin
			dataOut = bPort;
		end
		6'b101001: begin
			dataOut = aPort + bPort;
		end
		6'b?10001: begin
			dataOut = ~(aPort | bPort);
		end
	endcase
end

endmodule