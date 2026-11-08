(* blackbox *)
(* smtlib2_module *)
module fp16_classify (bits, is_nan, is_zero, is_inf);
    input  [15:0] bits;
    (* smtlib2_comb_expr = "(fp.isNaN ((_ to_fp 5 11) bits))" *)
    output is_nan;
    (* smtlib2_comb_expr = "(fp.isZero ((_ to_fp 5 11) bits))" *)
    output is_zero;
    (* smtlib2_comb_expr = "(fp.isInfinite ((_ to_fp 5 11) bits))" *)
    output is_inf;
endmodule