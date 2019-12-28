module ourClock(clk);

output reg clk;

always
begin
    clk = 0; 
    #100 clk = ~clk;
    #100;
end


endmodule 