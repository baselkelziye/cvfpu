localparam bit DIVSQRT_IS_TOP = 0;

bind fpnew_divsqrt_multi handshake_checker #(
  .IN_PAYLOAD_W(1),
  .OUT_PAYLOAD_W(1),
  .ASSUME_ENV(DIVSQRT_IS_TOP)
) divsqrt_handshake (
  .clk_i,
  .rst_ni,
  .flush_i,
  .in_valid_i,
  .in_ready_o,
  .payload_i(),
  .out_valid_o,
  .out_ready_i,
  .payload_o()
);

// bind fpnew_divsqrt_multi divsqrt_props #(
//   .ASSUME_ENV(DIVSQRT_IS_TOP)
// )

// divsqrt_props(
//     .clk_i,
//     .rst_ni,
//     .in_valid_i,
//     .in_ready_o,
//     .rnd_mode_i,
//     .op_i,
//     .dst_fmt_i,
//     .out_valid_o,
//     .out_ready_i

// );


bind fpnew_opgroup_block handshake_checker #(
  .IN_PAYLOAD_W(1),
  .OUT_PAYLOAD_W(1),
  .ASSUME_ENV(!DIVSQRT_IS_TOP)
) opgroup_divsqrt (
  .clk_i,
  .rst_ni,
  .flush_i,
  .in_valid_i,
  .in_ready_o,
  .payload_i(),
  .out_valid_o,
  .out_ready_i,
  .payload_o()
);

