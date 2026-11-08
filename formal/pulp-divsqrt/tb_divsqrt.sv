// tb_divsqrt.sv

module tb_divsqrt;

  localparam  int unsigned  DIVSQRT_OPGROUP_INDEX = 1;
  localparam fpnew_pkg::fpu_features_t       Features       = fpnew_pkg::RV64D;
  localparam fpnew_pkg::fpu_implementation_t Implementation = fpnew_pkg::DEFAULT_NOREGS;
  localparam fpnew_pkg::opgroup_e      OpGroup       = fpnew_pkg::DIVSQRT;
  localparam int unsigned              WIDTH         = Features.Width;
  localparam logic                     EnableVectors = Features.EnableVectors;
  localparam fpnew_pkg::divsqrt_unit_t DivSqrtSel    = fpnew_pkg::PULP;
  localparam fpnew_pkg::fmt_logic_t    FpFmtMask     = Features.FpFmtMask;
  localparam fpnew_pkg::ifmt_logic_t   IntFmtMask    = Features.IntFmtMask;

 
  localparam fpnew_pkg::fmt_unsigned_t   FmtPipeRegs  = Implementation.PipeRegs[DIVSQRT_OPGROUP_INDEX];
  localparam fpnew_pkg::fmt_unit_types_t FmtUnitTypes = Implementation.UnitTypes[DIVSQRT_OPGROUP_INDEX];
  localparam fpnew_pkg::pipe_config_t    PipeConfig   = Implementation.PipeConfig;


  localparam int unsigned NUM_FORMATS  = fpnew_pkg::NUM_FP_FORMATS;
  localparam int unsigned NUM_OPERANDS = fpnew_pkg::num_operands(OpGroup);
  localparam int unsigned NUM_LANES    = fpnew_pkg::max_num_lanes(WIDTH, FpFmtMask, EnableVectors);


  logic clk_i;
  logic rst_ni;
  logic flush_i;

  logic [2:0][WIDTH-1:0]                   operands_i;    // always 3-wide, unsliced
  logic [NUM_FORMATS-1:0][NUM_OPERANDS-1:0] is_boxed_i;
  fpnew_pkg::roundmode_e                   rnd_mode_i;
  fpnew_pkg::operation_e                   op_i;
  logic                                    op_mod_i;
  fpnew_pkg::fp_format_e                   src_fmt_i;
  fpnew_pkg::fp_format_e                   dst_fmt_i;
  fpnew_pkg::int_format_e                  int_fmt_i;
  logic                                    vectorial_op_i;
  logic                                    tag_i;          // TagType = logic below
  logic [NUM_LANES-1:0]                    simd_mask_i;
  logic                                    in_valid_i;
  logic                                    out_ready_i;

  logic [WIDTH-1:0]     result_o;
  fpnew_pkg::status_t   status_o;
  logic                 extension_bit_o;
  logic                 tag_o;
  logic                 out_valid_o;
  logic                 in_ready_o;
  logic                 busy_o;
  logic                 early_valid_o;


  fpnew_opgroup_block #(
    .OpGroup       ( OpGroup       ),
    .Width         ( WIDTH         ),
    .EnableVectors ( EnableVectors ),
    .DivSqrtSel    ( DivSqrtSel    ),
    .FpFmtMask     ( FpFmtMask     ),
    .IntFmtMask    ( IntFmtMask    ),
    .FmtPipeRegs   ( FmtPipeRegs   ),
    .FmtUnitTypes  ( FmtUnitTypes  ),
    .PipeConfig    ( PipeConfig    ),
    .TagType       ( logic         ),
    .TrueSIMDClass ( 1             )
  ) i_opgroup_block (
    .clk_i,
    .rst_ni,
    .operands_i,
    .is_boxed_i,
    .rnd_mode_i,
    .op_i,
    .op_mod_i,
    .src_fmt_i,
    .dst_fmt_i,
    .int_fmt_i,
    .vectorial_op_i,
    .tag_i,
    .simd_mask_i,
    .in_valid_i,
    .in_ready_o,
    .flush_i,
    .result_o,
    .status_o,
    .extension_bit_o,
    .tag_o,
    .out_valid_o,
    .out_ready_i,
    .busy_o,
    .early_valid_o
  );

endmodule : tb_divsqrt