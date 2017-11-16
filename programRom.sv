// Program Rom
module Rom(
  input [11:0] address,
  output [7:0] out
);
  
// Data storage
reg [7:0] data [0:4096];

// Load data

initial $readmemb("programRom.txt", data);

assign out = data[address];

endmodule
