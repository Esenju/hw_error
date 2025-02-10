// Peter Mbua
// Module: sync_ff (dual FF)
//       Dual FF to handle CDC for single-bit signals 
//       sync_ff1 stabilizes the output signal if source FF for 
//       async_sig captures metastability 

module sync_ff ( 
  input logic clk_dst
  ,input logic async_sig    // Async input signal 
  ,output reg sync_out      // Sync output 
);

  logic sync_ff1;

  always @(posedge clk_dst) begin 
    syn_ff1 <= async_sig;
    sync_out <= sync_ff1;
  end 
endmodule 
