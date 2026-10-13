(* --- Interface --- *)
FUNCTION_BLOCK Machine
VAR_INPUT
END_VAR
VAR
	chain  : Chain;
	stamps : ARRAY[LOWER_DEPTH..UPPER_DEPTH] OF STAMP;
END_VAR
