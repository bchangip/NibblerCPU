//-----------------------------------------------------
// Bryan Chan
// Project 2 - Nibble - Testbench
//-----------------------------------------------------
module testbench();
 
  
  /**********************************************************/
  /*	MICROROM TESTING									*/
  /*                            							*/
  /**********************************************************/

  //  // Conections
  // reg [3:0] instruction;
  // reg nC;
  // reg nZ;
  // reg ph;
  // wire incPC;
  // wire notLoadPC;
  // wire notLoadA;
  // wire notLoadFlags;
  // wire notCarryIn;
  // wire M;
  // wire [3:0] S;
  // wire notCsRam;
  // wire notWeRam;
  // wire notOeALU;
  // wire notOeIn;
  // wire notOeOprnd;
  // wire notLoadOut;

  // // Instantiate microrom
  // Microrom microrom (instruction, nC, nZ, ph, incPC, notLoadPC, notLoadA, notLoadFlags, notCarryIn, M, S, notCsRam, notWeRam, notOeALU, notOeIn, notOeOprnd, notLoadOut);

  // // Simulation
  // initial
  //   begin
  //     //Initial values
  //     instruction = 0000;
	 //  nC = 0;
	 //  nZ = 0;
	 //  ph = 0;
  //     // Logging
  //     $display("time - instruction - nC - nZ - ph ->> incPC - notLoadPC - notLoadA - notLoadFlags - notCarryIn - M - S - notCsRam - notWeRam - notOeALU - notOeIn - notOeOprnd - notLoadOut");
  //     $monitor("%d \t %b \t %b \t %b \t %b ->>\t %b \t %b \t %b \t %b \t %b \t %b \t %b \t %b \t %b \t %b \t %b \t %b \t %b", $time, instruction, nC, nZ, ph, incPC, notLoadPC, notLoadA, notLoadFlags, notCarryIn, M, S, notCsRam, notWeRam, notOeALU, notOeIn, notOeOprnd, notLoadOut);
      
  //     //Varying inputs for simulation
  //     #1 {instruction,nC,nZ,ph} = 7'b0110001;
  //   end

  /**********************************************************/
  /*	/MICROROM TESTING									*/
  /*                                                        */
  /**********************************************************/













  /**********************************************************/
  /*	ROM TESTING										*/
  /*                            							*/
  /**********************************************************/

  //Conections
  reg [11:0] address;
  reg notChipEnable = 0;
  reg notOutputEnable = 0;
  reg notWriteEnable = 0;
  wire [7:0] io;

  //Instantiate ROM
  Rom rom(address, notChipEnable, notOutputEnable, notWriteEnable, io);

    // Simulation
  initial
    begin
      //Initial values
      {address,notChipEnable,notOutputEnable,notWriteEnable} = 23'b000000000000001;
      // Logging
      $display("time - io");
      $monitor("%d \t %b", $time, io);
      
      //Varying inputs for simulation
      #1 {address,notChipEnable,notOutputEnable,notWriteEnable} = 23'b000000000000000;
      #1 {address,notChipEnable,notOutputEnable,notWriteEnable} = 23'b000000000000001;
      #1 {address,notChipEnable,notOutputEnable,notWriteEnable} = 23'b000000000000000;

    end

  /**********************************************************/
  /*	/ROM TESTING										*/
  /*                            							*/
  /**********************************************************/
  
  
  



  /**********************************************************/
  /*	CLOCK												*/
  /*                            							*/
  /**********************************************************/

  //Clock
  // always
  //   #1 clk = ~clk;

  /**********************************************************/
  /*	CLOCK 												*/
  /*                            							*/
  /**********************************************************/
 
  //Finish simulation
  initial 
    #100 $finish;



  // //EPWave
  // initial 
  //   begin
  // 	  $dumpfile("dump.vcd");
  // 	  $dumpvars(1);
  //   end
endmodule