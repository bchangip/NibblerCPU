/****************************************************************************************
*                                                                                       *
* https://www.bigmessowires.com/nibbler/                       													*
* Implementation by: Bryan Chan and Diego Regalado                    									*
*                                           																						*
*****************************************************************************************/
module Ram(
	input [11:0] address,
	input notChipEnable,
	input notWriteEnable,
	inout [3:0] io
);
	
// Data storage
reg [3:0] data [0:4095];
reg [3:0] outputData;

// Tristate buffer (Inout switching)
assign io = (~notChipEnable&&notWriteEnable) ? outputData : 4'bzzzz;

always @ (address or notChipEnable or notWriteEnable) begin
	if(~notChipEnable&&~notWriteEnable) begin
		data[address] = io;
	end
end

always @ (address or notChipEnable or notWriteEnable) begin
	if(~notChipEnable&&notWriteEnable) begin
		outputData = data[address];
	end
end

endmodule