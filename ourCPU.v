module ourCpu();
wire [31:0]inst;
wire clk, pcin, pcout, reset, write, WriteData, ReadData1, ReadData2;
wire Branch, MemRead, MemWrite, MemToReg, ALUOp, ALUSrc, RegWrite;
wire result,zero;
ourClock clock(clk);
ourPc pc(clk, pcin, pcout, reset, write);
ourInsMem insMem(clk, pcout, inst);
wire inss = (inst[31] == 1'b0) ? 32'b0: 32'b1;
wire mux1output;
wire ALU_Cnt;
wire ReadData;
ourControl ctrl(inst[6:0], Branch, MemRead, MemWrite, MemToReg, ALUOp, ALUSrc, RegWrite);
ourRegisterBank regBank(clk, inst[19:15], inst[24:20], inst[11:7], WriteData, ReadData1, ReadData2);
ourMultiPlexer multiplexer1( ReadData2,{inss,inst[31:0]}, ALUSrc, mux1output);
ourALUControl alucontrol(ALU_Cnt, ALUOp, {inst[30],inst[4:2]});
ourALU alu(ReadData1,mux1output,ALU_Cnt,result,zero);
ourDataMemory dataMemory(clk,result,ReadData,ReadData2,MemWrite,MemRead);

endmodule 