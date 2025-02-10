// Peter Mbua
// Module: handshake_sync
//       Used for Multi-Bit Control Signals. 
//       Used for control signals that require acknowledgment.
//       Works by exchanging request and acknowledge signals to ensure safe transfer.

module handshake_sync (
    input logic  clk_src, clk_dst
    ,input logic req_src           // Request from source domain
    ,output reg  ack_dst           // Acknowledgment in destination domain
);
    reg req_sync1, req_sync2;

    always @(posedge clk_dst) begin
        req_sync1 <= req_src;
        req_sync2 <= req_sync1;
        ack_dst <= req_sync2;       // Only acknowledge once the signal is stable
    end
endmodule
