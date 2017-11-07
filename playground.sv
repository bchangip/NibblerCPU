module assignment_operator ();

reg [31:0] a = 100;

initial begin
  $display (" a         := %h",  a );  
  a += 4; 
  $display (" a += 4    := %h",  a );  
  a -= 4; 
  $display (" a -= 4    := %h",  a ); 
  a *= 4; 
  $display (" a *= 4    := %h",  a ); 
  a /= 4; 
  $display (" a /= 4    := %h",  a ); 
  a %= 17; 
  $display (" a %s= 17    := %h", "%", a ); 
  a &= 16'hFFFF; 
  $display (" a &= 16'hFFFF    := %h",  a ); 
  a |= 16'hFFFF; 
  $display (" a |= 16'hFFFF    := %h",  a ); 
  a ^= 16'hAAAA; 
  $display (" a ^= 16h'AAAA    := %h",  a ); 
  a <<= 4; 
  $display (" a <<= 4   := %h",  a ); 
  a >>= 4; 
  $display (" a >>= 4   := %h",  a ); 
  a <<<= 14; 
  $display (" a <<<= 14  := %h",  a ); 
  a >>>= 14; 
  $display (" a >>>= 14  := %h",  a );
  #1 $finish;
end

endmodule