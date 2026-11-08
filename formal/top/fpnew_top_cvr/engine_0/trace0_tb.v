`ifndef VERILATOR
module testbench;
  reg [4095:0] vcdfile;
  reg clock;
`else
module testbench(input clock, output reg genclock);
  initial genclock = 1;
`endif
  reg genclock = 1;
  reg [31:0] cycle = 0;
  reg [3:0] PI_op_i;
  reg [0:0] PI_vectorial_op_i;
  reg [0:0] PI_clk_i;
  reg [63:0] \PI_operands_i[2] ;
  reg [63:0] \PI_operands_i[1] ;
  reg [2:0] PI_dst_fmt_i;
  reg [2:0] PI_rnd_mode_i;
  reg [0:0] PI_tag_i;
  reg [0:0] PI_rst_ni;
  reg [0:0] PI_simd_mask_i;
  reg [0:0] PI_in_valid_i;
  reg [0:0] PI_flush_i;
  reg [1:0] PI_int_fmt_i;
  reg [2:0] PI_src_fmt_i;
  reg [0:0] PI_op_mod_i;
  reg [0:0] PI_out_ready_i;
  reg [63:0] \PI_operands_i[0] ;
  fpnew_top UUT (
    .op_i(PI_op_i),
    .vectorial_op_i(PI_vectorial_op_i),
    .clk_i(PI_clk_i),
    .\operands_i[2] (\PI_operands_i[2] ),
    .\operands_i[1] (\PI_operands_i[1] ),
    .dst_fmt_i(PI_dst_fmt_i),
    .rnd_mode_i(PI_rnd_mode_i),
    .tag_i(PI_tag_i),
    .rst_ni(PI_rst_ni),
    .simd_mask_i(PI_simd_mask_i),
    .in_valid_i(PI_in_valid_i),
    .flush_i(PI_flush_i),
    .int_fmt_i(PI_int_fmt_i),
    .src_fmt_i(PI_src_fmt_i),
    .op_mod_i(PI_op_mod_i),
    .out_ready_i(PI_out_ready_i),
    .\operands_i[0] (\PI_operands_i[0] )
  );
`ifndef VERILATOR
  initial begin
    if ($value$plusargs("vcd=%s", vcdfile)) begin
      $dumpfile(vcdfile);
      $dumpvars(0, testbench);
    end
    #5 clock = 0;
    while (genclock) begin
      #5 clock = 0;
      #5 clock = 1;
    end
  end
`endif
  initial begin
`ifndef VERILATOR
    #1;
`endif
    // UUT.fpnew_top_b.$auto$async2sync.\cc:253:execute$19321  = 1'b0;
    // UUT.fpnew_top_b.$auto$async2sync.\cc:253:execute$19323  = 1'b0;
    // UUT.fpnew_top_b.$auto$async2sync.\cc:253:execute$19327  = 1'b0;
    // UUT.fpnew_top_b.$auto$async2sync.\cc:253:execute$19329  = 1'b0;
    // UUT.fpnew_top_b.$auto$async2sync.\cc:253:execute$19333  = 1'b0;
    UUT.fpnew_top_b.g_reset_seq.reset_cnt = 3'b000;
    UUT.\gen_operation_groups[0] .i_opgroup_block.i_arbiter._witness_.anyinit_verific_gen_arbiter_rr_q_reg_rr_arb_tree_sv_247_18109 = 3'b000;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi._witness_.anyinit_verific_ext_op_start_q_reg_fpnew_divsqrt_multi_sv_148_11227 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi._witness_.anyinit_verific_out_valid_q_reg_fpnew_divsqrt_multi_sv_290_11306 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi._witness_.anyinit_verific_result_aux_q_reg_fpnew_divsqrt_multi_sv_207_11263 = 5'b00000;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi._witness_.anyinit_verific_result_is_fp8_q_reg_fpnew_divsqrt_multi_sv_204_11253 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi._witness_.anyinit_verific_result_mask_q_reg_fpnew_divsqrt_multi_sv_206_11259 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi._witness_.anyinit_verific_result_tag_q_reg_fpnew_divsqrt_multi_sv_205_11256 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi._witness_.anyinit_verific_result_vec_op_q_reg_fpnew_divsqrt_multi_sv_208_11266 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi._witness_.anyinit_verific_state_q_reg_fpnew_divsqrt_multi_sv_289_11304 = 2'b00;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi._witness_.anyinit_verific_unit_done_q_reg_fpnew_divsqrt_multi_sv_217_11273 = 1'b0;
    // UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.divsqrt_handshake.$auto$async2sync.\cc:253:execute$19307  = 1'b0;
    // UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.divsqrt_handshake.$auto$async2sync.\cc:253:execute$19313  = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.held_result_q = 64'b0000000000000000000000000000000000000000000000000000000000000000;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.\held_status_q[DZ]  = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.\held_status_q[NV]  = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.\held_status_q[NX]  = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.\held_status_q[OF]  = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.\held_status_q[UF]  = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.nrbd_nrsc_U0.control_U0._witness_.anyinit_verific_Crtl_cnt_S_reg_control_mvp_sv_598_16008 = 6'b000000;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.nrbd_nrsc_U0.control_U0._witness_.anyinit_verific_Div_enable_SO_reg_control_mvp_sv_534_15983 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.nrbd_nrsc_U0.control_U0._witness_.anyinit_verific_Div_start_dly_S_reg_control_mvp_sv_518_15977 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.nrbd_nrsc_U0.control_U0._witness_.anyinit_verific_Done_SO_reg_control_mvp_sv_627_16013 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.nrbd_nrsc_U0.control_U0._witness_.anyinit_verific_Exp_result_prenorm_DP_reg_control_mvp_sv_3408_16902 = 13'b0000000000000;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.nrbd_nrsc_U0.control_U0._witness_.anyinit_verific_Format_sel_S_reg_control_mvp_sv_136_15924 = 2'b00;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.nrbd_nrsc_U0.control_U0._witness_.anyinit_verific_Partial_remainder_DP_reg_control_mvp_sv_2417_16851 = 58'b0000000000000000000000000000000000000000000000000000000000;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.nrbd_nrsc_U0.control_U0._witness_.anyinit_verific_Precision_ctl_S_reg_control_mvp_sv_164_15936 = 6'b000000;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.nrbd_nrsc_U0.control_U0._witness_.anyinit_verific_Quotient_DP_reg_control_mvp_sv_2463_16859 = 57'b000000000000000000000000000000000000000000000000000000000;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.nrbd_nrsc_U0.control_U0._witness_.anyinit_verific_Ready_SO_reg_control_mvp_sv_658_16018 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.nrbd_nrsc_U0.control_U0._witness_.anyinit_verific_Sqrt_enable_SO_reg_control_mvp_sv_566_15992 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.nrbd_nrsc_U0.control_U0._witness_.anyinit_verific_Sqrt_start_dly_S_reg_control_mvp_sv_552_15986 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.preprocess_U0._witness_.anyinit_verific_Exp_a_norm_DP_reg_preprocess_mvp_sv_363_17408 = 12'b000000000000;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.preprocess_U0._witness_.anyinit_verific_Exp_b_norm_DP_reg_preprocess_mvp_sv_404_17480 = 12'b000000000000;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.preprocess_U0._witness_.anyinit_verific_Inf_a_SP_reg_preprocess_mvp_sv_240_17298 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.preprocess_U0._witness_.anyinit_verific_Inf_b_SP_reg_preprocess_mvp_sv_240_17299 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.preprocess_U0._witness_.anyinit_verific_Mant_a_norm_DP_reg_preprocess_mvp_sv_348_17400 = 53'b00000000000000000000000000000000000000000000000000000;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.preprocess_U0._witness_.anyinit_verific_Mant_b_norm_DP_reg_preprocess_mvp_sv_389_17473 = 53'b00000000000000000000000000000000000000000000000000000;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.preprocess_U0._witness_.anyinit_verific_NaN_a_SP_reg_preprocess_mvp_sv_240_17300 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.preprocess_U0._witness_.anyinit_verific_NaN_b_SP_reg_preprocess_mvp_sv_240_17301 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.preprocess_U0._witness_.anyinit_verific_RM_DP_reg_preprocess_mvp_sv_319_17333 = 3'b000;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.preprocess_U0._witness_.anyinit_verific_SNaN_SP_reg_preprocess_mvp_sv_240_17302 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.preprocess_U0._witness_.anyinit_verific_Sign_z_DP_reg_preprocess_mvp_sv_296_17329 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.preprocess_U0._witness_.anyinit_verific_Special_case_dly_SBO_reg_preprocess_mvp_sv_267_17319 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.preprocess_U0._witness_.anyinit_verific_Zero_a_SP_reg_preprocess_mvp_sv_240_17296 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.gen_pulp_divsqrt.i_fpnew_divsqrt_multi.i_divsqrt_lei.preprocess_U0._witness_.anyinit_verific_Zero_b_SP_reg_preprocess_mvp_sv_240_17297 = 1'b0;
    UUT.\gen_operation_groups[1] .i_opgroup_block.i_arbiter._witness_.anyinit_verific_gen_arbiter_rr_q_reg_rr_arb_tree_sv_247_18521 = 3'b000;
    UUT.\gen_operation_groups[2] .i_opgroup_block.i_arbiter._witness_.anyinit_verific_gen_arbiter_rr_q_reg_rr_arb_tree_sv_247_18706 = 3'b000;
    // UUT.\gen_operation_groups[3] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.i_fpnew_cast_multi.cast_handshake.$auto$async2sync.\cc:253:execute$19307  = 1'b0;
    // UUT.\gen_operation_groups[3] .i_opgroup_block.gen_merged_slice.i_multifmt_slice.\gen_num_lanes[0] .active_lane.lane_instance.i_fpnew_cast_multi.cast_handshake.$auto$async2sync.\cc:253:execute$19313  = 1'b0;
    UUT.\gen_operation_groups[3] .i_opgroup_block.i_arbiter._witness_.anyinit_verific_gen_arbiter_rr_q_reg_rr_arb_tree_sv_247_18336 = 3'b000;
    UUT.i_arbiter._witness_.anyinit_verific_gen_arbiter_rr_q_reg_rr_arb_tree_sv_247_17932 = 2'b00;

    // state 0
    PI_op_i = 4'b0000;
    PI_vectorial_op_i = 1'b0;
    PI_clk_i = 1'b0;
    \PI_operands_i[2]  = 64'b0000000000000000000000000000000000000000000000000000000000000000;
    \PI_operands_i[1]  = 64'b0000000000000000000000000000000000000000000000000000000000000000;
    PI_dst_fmt_i = 3'b000;
    PI_rnd_mode_i = 3'b000;
    PI_tag_i = 1'b0;
    PI_rst_ni = 1'b0;
    PI_simd_mask_i = 1'b0;
    PI_in_valid_i = 1'b0;
    PI_flush_i = 1'b0;
    PI_int_fmt_i = 2'b00;
    PI_src_fmt_i = 3'b000;
    PI_op_mod_i = 1'b0;
    PI_out_ready_i = 1'b0;
    \PI_operands_i[0]  = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  end
  always @(posedge clock) begin
    // state 1
    if (cycle == 0) begin
      PI_op_i <= 4'b0000;
      PI_vectorial_op_i <= 1'b0;
      PI_clk_i <= 1'b0;
      \PI_operands_i[2]  <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      \PI_operands_i[1]  <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      PI_dst_fmt_i <= 3'b000;
      PI_rnd_mode_i <= 3'b000;
      PI_tag_i <= 1'b0;
      PI_rst_ni <= 1'b0;
      PI_simd_mask_i <= 1'b0;
      PI_in_valid_i <= 1'b0;
      PI_flush_i <= 1'b0;
      PI_int_fmt_i <= 2'b00;
      PI_src_fmt_i <= 3'b000;
      PI_op_mod_i <= 1'b0;
      PI_out_ready_i <= 1'b0;
      \PI_operands_i[0]  <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end

    // state 2
    if (cycle == 1) begin
      PI_op_i <= 4'b0000;
      PI_vectorial_op_i <= 1'b0;
      PI_clk_i <= 1'b0;
      \PI_operands_i[2]  <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      \PI_operands_i[1]  <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      PI_dst_fmt_i <= 3'b000;
      PI_rnd_mode_i <= 3'b000;
      PI_tag_i <= 1'b0;
      PI_rst_ni <= 1'b0;
      PI_simd_mask_i <= 1'b0;
      PI_in_valid_i <= 1'b0;
      PI_flush_i <= 1'b0;
      PI_int_fmt_i <= 2'b00;
      PI_src_fmt_i <= 3'b000;
      PI_op_mod_i <= 1'b0;
      PI_out_ready_i <= 1'b0;
      \PI_operands_i[0]  <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end

    // state 3
    if (cycle == 2) begin
      PI_op_i <= 4'b0000;
      PI_vectorial_op_i <= 1'b0;
      PI_clk_i <= 1'b0;
      \PI_operands_i[2]  <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      \PI_operands_i[1]  <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      PI_dst_fmt_i <= 3'b000;
      PI_rnd_mode_i <= 3'b000;
      PI_tag_i <= 1'b0;
      PI_rst_ni <= 1'b0;
      PI_simd_mask_i <= 1'b0;
      PI_in_valid_i <= 1'b0;
      PI_flush_i <= 1'b0;
      PI_int_fmt_i <= 2'b00;
      PI_src_fmt_i <= 3'b000;
      PI_op_mod_i <= 1'b0;
      PI_out_ready_i <= 1'b0;
      \PI_operands_i[0]  <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end

    // state 4
    if (cycle == 3) begin
      PI_op_i <= 4'b0000;
      PI_vectorial_op_i <= 1'b0;
      PI_clk_i <= 1'b0;
      \PI_operands_i[2]  <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      \PI_operands_i[1]  <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      PI_dst_fmt_i <= 3'b000;
      PI_rnd_mode_i <= 3'b000;
      PI_tag_i <= 1'b0;
      PI_rst_ni <= 1'b1;
      PI_simd_mask_i <= 1'b0;
      PI_in_valid_i <= 1'b0;
      PI_flush_i <= 1'b0;
      PI_int_fmt_i <= 2'b00;
      PI_src_fmt_i <= 3'b000;
      PI_op_mod_i <= 1'b0;
      PI_out_ready_i <= 1'b0;
      \PI_operands_i[0]  <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end

    // state 5
    if (cycle == 4) begin
      PI_op_i <= 4'b0000;
      PI_vectorial_op_i <= 1'b0;
      PI_clk_i <= 1'b0;
      \PI_operands_i[2]  <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      \PI_operands_i[1]  <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
      PI_dst_fmt_i <= 3'b000;
      PI_rnd_mode_i <= 3'b000;
      PI_tag_i <= 1'b0;
      PI_rst_ni <= 1'b1;
      PI_simd_mask_i <= 1'b0;
      PI_in_valid_i <= 1'b0;
      PI_flush_i <= 1'b0;
      PI_int_fmt_i <= 2'b00;
      PI_src_fmt_i <= 3'b000;
      PI_op_mod_i <= 1'b0;
      PI_out_ready_i <= 1'b0;
      \PI_operands_i[0]  <= 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end

    genclock <= cycle < 5;
    cycle <= cycle + 1;
  end
endmodule
