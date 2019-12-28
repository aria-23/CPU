module ourControl(inst, Branch, MemRead, MemWrite, MemToReg, ALUOp, ALUSrc, RegWrite);
 input [6:0]inst;
 output reg[1:0]ALUOp;
 output reg Branch, MemRead, MemWrite, MemToReg, ALUSrc, RegWrite;
 always @(*)
  begin
   casex(inst)
   7'b0110011:
    begin
    ALUSrc = 1'b0;
    MemToReg = 1'b0;
    RegWrite = 1'b1;
    MemRead = 1'b0;
    MemWrite = 1'b0;
    Branch = 1'b0;
    ALUOp = 2'b10;
    end
   7'b0000011:
    begin
    ALUSrc = 1'b1;
    MemToReg = 1'b1;
    RegWrite = 1'b1;
    MemRead = 1'b1;
    MemWrite = 1'b0;
    Branch = 1'b0;
    ALUOp = 2'b00;
    end
   7'b0100011:
    begin
    ALUSrc = 1'b1;
    MemToReg = 1'bx;
    RegWrite = 1'b0;
    MemRead = 1'b0;
    MemWrite = 1'b1;
    Branch = 1'b0;
    ALUOp = 2'b00;
    end
   7'b1100011:
    begin
    ALUSrc = 1'b0;
    MemToReg = 1'bx;
    RegWrite = 1'b0;
    MemRead = 1'b0;
    MemWrite = 1'b0;
    Branch = 1'b1;
    ALUOp = 2'b01;
    end
   default:
    begin
    ALUSrc = 1'b0;
    MemToReg = 1'b0;
    RegWrite = 1'b1;
    MemRead = 1'b0;
    MemWrite = 1'b0;
    Branch = 1'b0;
    ALUOp = 2'b10;
    end
   endcase
 end
endmodule
