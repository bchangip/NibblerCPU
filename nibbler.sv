//-----------------------------------------------------
// Bryan Chan
// Project 2 - Nibble - Testbench
//-----------------------------------------------------
module Nibbler(
	input clk, notReset,
	input [3:0] pushbuttons,
	output phase, notLoadA,
	output [1:0] flags,
	output [3:0] instr, operand, dataBus, ffOut, aPort, aluResult,
	output [7:0] programByte,
	output [11:0] address, addressCon
);

wire [11:0] address;
wire [11:0] addressCon;
wire [7:0] programByte;
wire [3:0] instr, operand, aPort, bPort, aluResult, dataBus, S;
wire aluC;
wire aluZ;
wire phase;
wire [1:0] flags;
wire incPC, notLoadPC, notLoadA, notLoadFlags, notCsRam, notWeRam, notOeALU, notOeIn, notOeOprnd, notLoadOut, notCarryIn, M, orNotChipSelect;

assign orNotChipSelect = clk | notCsRam;
assign addressCon = {operand, programByte};

ProgramCounter programCounter(
	.addressIn(addressCon),
	.incPC(incPC),
	.notReset(notReset),
	.notLoadPC(notLoadPC),
	.clk(clk),
	.addressOut(address)
);

Rom rom(
	.address(address),
	.out(programByte)
);

Fetch fetch(
	.programByte(programByte),
	.clk(clk),
	.phase(phase),
	.notReset(notReset),
	.instr(instr),
	.operand(operand)
);

Flags flagsModule(
	.c(aluC),
	.z(aluZ),
	.notReset(notReset),
	.clk(clk),
	.flagsOut(flags)
);

Phase phaseModule(
	.notReset(notReset),
	.clk(clk),
	.phaseOut(phase)
);

Microrom microRom(
	.instruction(instr),
	.nC(flags[0]),
	.nZ(flags[1]),
	.ph(phase),
	.incPC(incPC),
	.notLoadPC(notLoadPC),
	.notLoadA(notLoadA),
	.notLoadFlags(notLoadFlags),
	.notCarryIn(notCarryIn),
	.M(M),
	.S(S),
	.notCsRam(notCsRam),
	.notWeRam(notWeRam),
	.notOeALU(notOeALU),
	.notOeIn(notOeIn),
	.notOeOprnd(notOeOprnd),
	.notLoadOut(notLoadOut)
);

A a(
	.dataIn(aluResult),
	.notReset(notReset),
	.clk(clk),
	.notLoadA(notLoadA),
	.dataOut(aPort)
);

ALU alu(
	.notCarryIn(notCarryIn),
	.mode(M),
	.func(S),
	.aPort(aPort),
	.bPort(dataBus),
	.dataOut(aluResult),
	.carryOut(aluC),
	.zeroOut(aluZ)
);

QuadTristate aluOut(
	.dataIn(aluResult),
	.enable(notOeALU),
	.dataOut(dataBus)
);

QuadTristate fetchOut(
	.dataIn(operand),
	.enable(notOeOprnd),
	.dataOut(dataBus)
);

Ram ram(
	.address(addressCon),
	.notChipEnable(orNotChipSelect),
	.notWriteEnable(notWeRam),
	.io(dataBus)
);

endmodule