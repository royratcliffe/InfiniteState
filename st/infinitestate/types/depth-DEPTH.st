(* --- Interface --- *)
(* Depth type representing the loop index for iterating through state
   topology tuples. Use DINT as the underlying data type, a 32-bit
   signed integer used as a zero-based array index. LOWER_BOUND and
   UPPER_BOUND functions answer with this type. *)
TYPE DEPTH : DINT; END_TYPE
