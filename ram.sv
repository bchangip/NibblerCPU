// RAM
module Ram(
  input [11:0] address,
  input notChipEnable,
  input notOutputEnable,
  input notWriteEnable,
  inout [7:0] io
);
  
// Data storage
reg [7:0] data [4095:0];
reg [7:0] outputData;

// Tristate buffer (Inout switching)
assign io = (~notChipEnable&&~notOutputEnable&&notWriteEnable) ? outputData : 8'bzzzzzzzz;

always @ (address or io or ~notChipEnable or ~notWriteEnable) begin
  if(~notChipEnable&&~notWriteEnable) begin
    data[address] = io;
  end
end

always @ (address or ~notChipEnable or ~notWriteEnable or ~notOutputEnable) begin
  if(~notChipEnable&&~notWriteEnable&&~notOutputEnable) begin
    outputData = data[address];
  end
end

endmodule