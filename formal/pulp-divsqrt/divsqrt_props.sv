module divsqrt_props #(
    //0 means that this module is being instantiated and the parent module should hold the conditinos
    //1 means that this module is the top level and need to assume/constraint some signals (use ASSUME!)
    parameter bit ASSUME_ENV = 0
)
(
    input logic clk_i,
    input logic rst_ni,
    input logic                        in_valid_i,
    input logic                        in_ready_o,
    input fpnew_pkg::roundmode_e rnd_mode_i,
    input  fpnew_pkg::operation_e       op_i,
    input  fpnew_pkg::fp_format_e       dst_fmt_i,
    input logic out_valid_o,
    input logic out_ready_i

);

default clocking cb @(posedge clk_i); endclocking

property p_valid_op_type;
    disable iff (!rst_ni)
    (in_valid_i & in_ready_o) |-> (op_i == fpnew_pkg::DIV || op_i == fpnew_pkg::SQRT);
endproperty

generate
    if(ASSUME_ENV) begin : g_env_assume_divsqrt_props
        assume property (p_valid_op_type);
    end else begin : g_env_assert_divsqrt_props
        assert property (p_valid_op_type);
    end

endgenerate

endmodule