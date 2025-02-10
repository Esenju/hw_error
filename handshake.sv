

module handshake_sync (
    input clk_src, clk_dst,
    input req_src, // Request from source domain
    output reg ack_dst // Acknowledgment in destination domain
);
    reg req_sync1, req_sync2;

    always @(posedge clk_dst) begin
        req_sync1 <= req_src;
        req_sync2 <= req_sync1;
        ack_dst <= req_sync2;  // Only acknowledge once the signal is stable
    end
endmodule
