
`ifndef DIVSQRT_IS_TOP
  `define DIVSQRT_IS_TOP 1'b0
`endif
bind fpnew_divsqrt_multi handshake_checker #(
  .IN_PAYLOAD_W  (1),
  .OUT_PAYLOAD_W (1),
  .ASSUME_ENV(`DIVSQRT_IS_TOP)
) divsqrt_handshake (
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