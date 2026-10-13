(* --- Interface --- *)
FUNCTION_BLOCK Machine
VAR_INPUT
END_VAR
VAR
	chain  : Chain;
	stamps : ARRAY[0..MAX_DEPTH] OF SysTimeRtc.SYSTIME;
END_VAR
