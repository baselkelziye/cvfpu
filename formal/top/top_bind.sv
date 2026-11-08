bind fpnew_top handshake_checker #(
    .IN_PAYLOAD_W(1),
    .OUT_PAYLOAD_W(1),
    .ASSUME_ENV(1)
) fpnew_top_b (
    .clk_i,
    .rst_ni,
    .flush_i,
    .in_valid_i,
    .in_ready_o,
    .payload_i(),
    .out_valid_o(),
    .out_ready_i(),
    .payload_o()
);
