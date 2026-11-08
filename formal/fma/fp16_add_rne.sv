(* blackbox *)
(* smtlib2_module *)
module fp16_add_rne(a,b,result);
input [15:0] a;
input [15:0] b;

(* smtlib2_comb_expr = "((_ fp.to_ieee_bv 16) (fp.add RNE ((_ to_fp 5 11) a) ((_ to_fp 5 11) b)))" *)
output [15:0] result;
endmodule