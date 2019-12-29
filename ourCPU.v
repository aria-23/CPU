module ourCpu();
wire [31:0]inst;
wire clk, pcout, reset, write, WriteData, ReadData1, ReadData2;
wire Branch, MemRead, MemWrite, MemToReg, ALUOp, ALUSrc, RegWrite;
wire result,zero;
wire pcin = 64'b0;
//clock
ourClock clock(clk);
//program counter
ourPc pc(clk, pcin, pcout, reset, write);
//instruction memory
ourInsMem insMem(clk, pcout, inst);
//control
ourControl ctrl(inst[6:0], Branch, MemRead, MemWrite, MemToReg, ALUOp, ALUSrc, RegWrite);
//register bank
ourRegisterBank regBank(clk, inst[19:15], inst[24:20], inst[11:7], WriteData, ReadData1, ReadData2);
//mux 1
wire immgenoutput;
ourImmGen immgen(inst[31:0], immgenoutput);
wire mux1output;
ourMultiPlexor multiplexor1( ReadData2,immgenoutput, ALUSrc, mux1output);
//alu control
wire ALU_Cnt;
ourALUControl alucontrol(ALU_Cnt, ALUOp, {inst[30],inst[4:2]});
//alu
ourALU alu(ReadData1,mux1output,ALU_Cnt,result,zero);
//mux2
wire mux2output;
wire andd;
and(andd, Branch, zero);
ourMultiPlexor multiplexor2(pcout+4, pcout+immgenoutput, andd, mux2output); 
assign pcin = mux2output;
//data memory
wire ReadData;
ourDataMemory dataMemory(clk,result,ReadData,ReadData2,MemWrite,MemRead);
//mux3
wire mux3output;
ourMultiPlexor multiplexor3(result, ReadData, MemToReg, mux3output);
assign WriteData = mux3output;

endmodule 
