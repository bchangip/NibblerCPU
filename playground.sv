/****************************************************************************************
*                                                                                       *
* https://www.bigmessowires.com/nibbler/                                                *
* Implementation by: Bryan Chan and Diego Regalado                                      *
*                                                                                       *
*****************************************************************************************/
module testbench();
  reg clk;

  initial
    begin
      {clk} = 0;
      $monitor("%b", clk);
    end

  always
    #1 clk = ~clk;
  initial 
    #1000 $finish;
endmodule