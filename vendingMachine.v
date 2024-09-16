module vendingMachine(
  input [3:0] amt,
  input reset, 
  input clk,
  output reg item,
  output reg [3:0] change
);

  reg [3:0] count;

  always @(posedge clk) begin
    if (reset==1) begin
      change <= 0;
      count <= 0;
      item <= 0;
    end else begin
      case ({count, amt})
        {4'd0, 4'd0}: begin
          count <= 0;
          change <= 0;
          item <= 0;
        end
        {4'd0, 4'd5}: begin
          count <= 5;
          change <= 0;
          item <= 0;
        end
        {4'd5, 4'd0}: begin
          count <= 0;
          change <= 5;
          item <= 0;
        end
        {4'd5, 4'd5}: begin
          count <= 10;
          change <= 0;
          item <= 0;
        end
        {4'd5, 4'd10}: begin
          count <= 0;
          change <= 0;
          item <= 1;
        end
        {4'd10, 4'd10}: begin
          count <= 0;
          change <= 5;
          item <= 1;
        end
        {4'd10, 4'd5}: begin
          count <= 0;
          change <= 0;
          item <= 1;
        end
        {4'd0, 4'd15}: begin
          count <= 0;
          change <= 0;
          item <= 1;
        end
        {4'd10, 4'd0}: begin
          count <= 0;
          change <= 10;
          item <= 0;
        end
        default: begin
          count <= count;  
          change <= change; 
          item <= item;     
        end
      endcase
    end
  end
endmodule
