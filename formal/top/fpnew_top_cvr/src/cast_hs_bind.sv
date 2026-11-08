
`ifndef CAST_IS_TOP
  `define CAST_IS_TOP 1'b0
`endif
bind fpnew_cast_multi handshake_checker #(
  .IN_PAYLOAD_W  (1),
  .OUT_PAYLOAD_W (1),
  .ASSUME_ENV(`CAST_IS_TOP)
) cast_handshake (
  .clk_i,
  .rst_ni,
  .flush_i,
  .in_valid_i,
  .in_ready_o,
  .payload_i  (),
  .out_valid_o,
  .out_ready_i,
  .payload_o  ()
);