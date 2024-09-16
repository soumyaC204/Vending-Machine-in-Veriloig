module vendingMachine_tb;
  reg clk;
  reg [3:0] amt;
  reg reset;
  wire [3:0] change;
  wire item;

  vendingMachine vm (
    .clk(clk),
    .amt(amt),
    .item(item),
    .reset(reset),
    .change(change)
  );

  always #5 clk = ~clk;

  initial begin
   reset = 1;
   clk=0;
    $dumpfile("vendingmachine_tb.vcd");
    $dumpvars(0, vendingMachine_tb);
    #10 reset = 0;
     amt = 4'd5;
    #10 reset = 0;amt = 4'd10;
    #10 reset = 0;amt = 4'd5;
    #10 reset = 0;amt = 4'd5;
    #10 reset = 0;amt = 4'd0;
    #10 reset = 0;amt = 4'd10;
    #10 amt=0;
    #100 $finish;
  end

  initial begin
    $monitor("Time = %0t | Amt = %b | Item = %b | Change = %b", 
             $time, amt, item, change);
  end
endmodule
