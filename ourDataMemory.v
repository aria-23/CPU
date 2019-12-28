module ourDataMemory(clk,Address,ReadData,WriteData,MemWrite,MemRead);
 input clk,MemRead,MemWrite;
 parameter n =63;
 input [n:0]Address;
 input [n:0]WriteData;
 output [n:0]ReadData;
 reg [n:0]memory[0:1023];
 always@(posedge clk)
  begin
   if(MemWrite)
    memory[Address] <= WriteData;
  end
 assign ReadData = (MemRead == 1'b1) ? memory[Address]:64'd0;
endmodule 