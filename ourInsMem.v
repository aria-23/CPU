module insMem( clk, address, instruction );
 input clk;
 parameter n=63;
 input [n:0] address;
 output reg[31:0] instruction ;
 integer i =0;
 reg [n:0]memory[0:1023];
 always@(posedge clk)
   begin
    instruction = memory[address];
   end
endmodule 