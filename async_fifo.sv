// Peter Mbua
// Module: async_fifo
//       Used when transferring multiple bits across different clock domains. 
//       Write clock domain writes data. 
//       Read clock domain reads data.
//       A proper handshake mechanism ensures safe transfers.

module async_fifo( #parameter DATA_WIDTH = 7
)
  (
  input logic wr_clk, rd_clk   // Write and Read clocks
  ,input logic wr_en, rd_en
  ,input [DATA_WIDTH-1:0] wr_data
  ,output logic [DATA_WIDTH-1:0] rd_data
);

  reg [DATA_WIDTH-1:0] fifo_mem [15:0];  // 16-depth FIFO
  logic [3:0] wr_ptr, rd_ptr;

  always @(posedge wr_clk) begin
    if (wr_en) begin
      fifo_mem[wr_ptr] <= wr_data;
      wr_ptr <= wr_ptr + 1;
      end
    end
  
  always @(posedge rd_clk) begin
    if (rd_en) begin
      rd_data <= fifo_mem[rd_ptr];
      rd_ptr <= rd_ptr + 1;
    end
    end
endmodule
