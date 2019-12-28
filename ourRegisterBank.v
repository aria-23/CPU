module ourRegisterBank(clk, ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, ReadData1, ReadData2);

 input clk,ReadRegister1,ReadRegister2,WriteRegister,WriteData,RegWrite;
 parameter n = 63;
 output [n:0]ReadData1;
 output [n:0]ReadData2;

 integer i =0;
 reg [n:0]registers[0:31];
 
 always@(posedge clk)
  begin
   begin
    if (RegWrite)
     registers[WriteRegister] <= WriteData;
   end
  end
 assign ReadData1 = registers[ReadRegister1];
 assign ReadData2 = registers[ReadRegister2];

endmodule 