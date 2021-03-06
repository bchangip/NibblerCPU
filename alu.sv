/****************************************************************************************
*																						*
*	https://www.bigmessowires.com/nibbler/												*
*	Implementation by: Bryan Chan and Diego Regalado									*
*																						*
*****************************************************************************************/

module ALU(
  input notCarryIn,
  input mode,
  input [3:0] func,
  input [3:0] aPort,
  input [3:0] bPort,
  output [3:0] dataOut,
  output carryOut,
  output zeroOut
);

reg [3:0] dataOut = 0;
reg carryOut = 0;
reg zeroOut = 0;
reg [4:0] comparisonRegister = 0;

always @ (notCarryIn or mode or func or aPort or bPort) begin
	casex({notCarryIn, mode, func})
		6'b100000: begin
			dataOut = aPort;
		end
		6'b000110: begin
			dataOut = aPort - bPort;
			if(aPort < bPort) begin
				carryOut = 1;
			end else begin
				carryOut = 0;
			end
		end
		6'b?11010: begin
			dataOut = bPort;
		end
		6'b101001: begin
			dataOut = aPort + bPort;
			comparisonRegister = aPort + bPort;
			if(comparisonRegister > 4'b1111) begin
				carryOut = 1;
			end else begin
				carryOut = 0;
			end
		end
		6'b?10001: begin
			dataOut = ~(aPort | bPort);
		end
	endcase

	zeroOut = ~|dataOut;
end

endmodule