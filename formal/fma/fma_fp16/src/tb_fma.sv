module tb_fma();

parameter int unsigned               NumPipeRegs = 0;
parameter fpnew_pkg::pipe_config_t   PipeConfig  = fpnew_pkg::BEFORE;
parameter type                       TagType     = logic;
parameter type                       AuxType     = logic;

`ifdef FP16
  localparam fpnew_pkg::fp_format_e FmtSel = fpnew_pkg::FP16;
`elsif FP32
  localparam fpnew_pkg::fp_format_e FmtSel = fpnew_pkg::FP32;
`elsif FP64
  localparam fpnew_pkg::fp_format_e FmtSel = fpnew_pkg::FP64;
`else
  `error "No FP format defined: compile with -DFP16, -DFP32, or -DFP64"
`endif

localparam fpnew_pkg::fmt_logic_t FpFmtConfig =
    fpnew_pkg::fmt_logic_t'(1) << FmtSel;

`ifdef RNE
  localparam fpnew_pkg::roundmode_e ROUNDING_MODE = fpnew_pkg::RNE;
`elsif RTZ
  localparam fpnew_pkg::roundmode_e ROUNDING_MODE = fpnew_pkg::RTZ;
`elsif RDN
  localparam fpnew_pkg::roundmode_e ROUNDING_MODE = fpnew_pkg::RDN;
`elsif RUP
  localparam fpnew_pkg::roundmode_e ROUNDING_MODE = fpnew_pkg::RUP;
`elsif RMM
  localparam fpnew_pkg::roundmode_e ROUNDING_MODE = fpnew_pkg::RMM;
`else
  `error "No rounding mode defined: compile with -DRNE, -DRTZ, -DRDN, -DRUP, or -DRMM"
`endif

`ifdef ADD
    localparam fpnew_pkg::operation_e OPERATION_TYPE = fpnew_pkg::ADD;
    localparam logic                  OPERATION_MOD  = 1'b0;
`elsif SUB
    localparam fpnew_pkg::operation_e OPERATION_TYPE = fpnew_pkg::ADD;
    localparam logic                  OPERATION_MOD  = 1'b1;
`else
    `error "Operation is not defined"
`endif

logic clk_i, rst_ni, flush_i;

logic [2:0][fpnew_pkg::max_fp_width(FpFmtConfig)-1:0] operands_i;
logic [fpnew_pkg::NUM_FP_FORMATS-1:0][2:0]            is_boxed_i;


fpnew_pkg::operation_e  op_i;
logic                   op_mod_i;
fpnew_pkg::fp_format_e  src_fmt_i, src2_fmt_i, dst_fmt_i;
fpnew_pkg::roundmode_e rnd_mode_i;

logic tag_i, mask_i, aux_i;
logic tag_o, mask_o, aux_o;

logic in_valid_i, in_ready_o;
logic out_valid_o, out_ready_i;
logic busy_o, early_out_valid_o;

logic [fpnew_pkg::max_fp_width(FpFmtConfig)-1:0] result_o;
fpnew_pkg::status_t                              status_o;
logic                                            extension_bit_o;

logic [(NumPipeRegs == 0 ? 1 : NumPipeRegs)-1:0] reg_ena_i;
logic [15:0] golden_result;
logic golden_is_nan;

localparam logic [15:0] CANONICAL_NAN_FP16 = 16'h7E00;

assign tag_i     = 1'b0;
assign mask_i    = 1'b0;
assign aux_i     = 1'b0;
assign reg_ena_i = '0;

fpnew_fma_multi #(
    .FpFmtConfig (FpFmtConfig),
    .NumPipeRegs (NumPipeRegs),
    .PipeConfig  (PipeConfig),
    .TagType     (TagType),
    .AuxType     (AuxType)
) u_dut (
    .clk_i             (clk_i),
    .rst_ni            (rst_ni),
    .operands_i        (operands_i),
    .is_boxed_i        (is_boxed_i),
    .rnd_mode_i        (rnd_mode_i),
    .op_i              (op_i),
    .op_mod_i          (op_mod_i),
    .src_fmt_i         (src_fmt_i),
    .src2_fmt_i        (src2_fmt_i),
    .dst_fmt_i         (dst_fmt_i),
    .tag_i             (tag_i),
    .mask_i            (mask_i),
    .aux_i             (aux_i),
    .in_valid_i        (in_valid_i),
    .in_ready_o        (in_ready_o),
    .flush_i           (flush_i),
    .result_o          (result_o),
    .status_o          (status_o),
    .extension_bit_o   (extension_bit_o),
    .tag_o             (tag_o),
    .mask_o            (mask_o),
    .aux_o             (aux_o),
    .out_valid_o       (out_valid_o),
    .out_ready_i       (out_ready_i),
    .busy_o            (busy_o),
    .reg_ena_i         (reg_ena_i),
    .early_out_valid_o (early_out_valid_o)
);

handshake_checker #(
    .IN_PAYLOAD_W  (1),
    .OUT_PAYLOAD_W (1),
    .ASSUME_ENV    (1)
) u_handshake (
    .clk_i       (clk_i),
    .rst_ni      (rst_ni),
    .flush_i     (flush_i),
    .in_valid_i  (in_valid_i),
    .in_ready_o  (in_ready_o),
    .payload_i   (1'b0),
    .out_valid_o (out_valid_o),
    .out_ready_i (out_ready_i),
    .payload_o   (1'b0)
);

fp16_add_rne fp16_add_rne_u
 (.a(operands_i[1]),
  .b(operands_i[2]),
  .result(golden_result));

fp16_classify u_classify
 (.bits(golden_result),
  .is_nan(golden_is_nan),
  .is_zero(), .is_inf()
);


default clocking cb @(posedge clk_i); endclocking

property p_golden_reference;
    disable iff (!rst_ni)
    (out_valid_o & out_ready_i) |->
        (golden_is_nan ? (result_o == CANONICAL_NAN_FP16)
                        : (result_o == golden_result));
endproperty

a_golden_reference: assert property (p_golden_reference);

//Assumptions per Format-Operation-Rounding Mode
always @(*) begin
  assume (src_fmt_i  == FmtSel);
  assume (src2_fmt_i == FmtSel);
  assume (dst_fmt_i  == FmtSel);
  assume (rnd_mode_i == ROUNDING_MODE);
  assume (op_mod_i   == OPERATION_MOD);
  assume (op_i       == OPERATION_TYPE);
  assume (is_boxed_i[FmtSel] == 3'b111);
//   assume (is_boxed_i == {fpnew_pkg::NUM_FP_FORMATS{3'b111}});
  //Control Signals 
  assume(!reg_ena_i); //No reg control
  assume(!flush_i); //no flush

end
endmodule