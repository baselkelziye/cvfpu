module handshake_checker #(
  parameter int unsigned IN_PAYLOAD_W  = 1,
  parameter int unsigned OUT_PAYLOAD_W = 1,
  //0 means that this module is being instantiated and the parent module should hold the conditinos
  //1 means that this module is the top level and need to assume/constraint some signals (use ASSUME!)
  parameter bit          ASSUME_ENV = 1
) (
  input logic clk_i,
  input logic rst_ni,
  input logic flush_i,
 
  input logic                     in_valid_i,
  input logic                     in_ready_o,
  input logic [IN_PAYLOAD_W-1:0]  payload_i,
 
  input logic                     out_valid_o,
  input logic                     out_ready_i,
  input logic [OUT_PAYLOAD_W-1:0] payload_o
);

default clocking cb @(posedge clk_i); endclocking

generate
  if (ASSUME_ENV) begin : g_reset_seq
    logic [2:0] reset_cnt = '0;

    always_ff @(posedge clk_i) begin
      if (reset_cnt < 3'd4) begin
        reset_cnt <= reset_cnt + 1'b1;
      end
    end

    logic f_rst_n;
    assign f_rst_n = (reset_cnt == 3'd4);

    a_force_reset_sequence: assume property (!f_rst_n |-> !rst_ni);
    a_force_reset_release:  assume property (f_rst_n  |->  rst_ni);
  end
endgenerate


//On reset, Input should be not valid, and we should be ready to accept new input
property p_reset_inp_idle;
  !rst_ni |-> (!in_valid_i & out_ready_i);
endproperty

//On reset, Output should not be valid, and master should be ready to accept new output
property p_reset_out_idle;
  !rst_ni |-> (!out_valid_o & in_ready_o);
endproperty
a_reset_out_idle : assert property (p_reset_out_idle);

//If unit is not ready to recieve input but we have valid data on bus,our request should be stable
property p_inp_stable;
  disable iff (!rst_ni)
  (in_valid_i & !in_ready_o & !flush_i) |=> /*$stable(payload_i)&& */ in_valid_i;
endproperty

//If unit has a valid output, but master is not ready to accept. the valid output shall be stable (backpressure)
property p_out_stable;
  disable iff (!rst_ni)
  (out_valid_o & !out_ready_i & !flush_i) |=> /*$stable(payload_o) &&*/ out_valid_o;
endproperty
a_out_stable: assert property (p_out_stable);

//Cover a valid output handshake
c_out_handshake: cover property (
  disable iff (!rst_ni) out_valid_o && out_ready_i
);

generate
  if (ASSUME_ENV) begin : g_env_assume_handshake_checker
    a_reset_inp_idle : assume property (p_reset_inp_idle);
    a_inp_stable     : assume property (p_inp_stable);
  end else begin : g_env_assert_handshake_checker
    a_reset_inp_idle : assert property (p_reset_inp_idle);
    a_inp_stable     : assert property (p_inp_stable);
  end
endgenerate

endmodule