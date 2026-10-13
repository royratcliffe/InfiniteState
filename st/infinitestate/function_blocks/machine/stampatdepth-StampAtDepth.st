(* --- Interface --- *)
METHOD StampAtDepth : STAMP
VAR_INPUT
	depth : DEPTH;
END_VAR

(* --- Implementation --- *)
StampAtDepth := EMPTY_STAMP;

IF depth = ERROR_DEPTH THEN
	RETURN;
END_IF

IF LOWER_BOUND(stamps, 1) > depth OR depth > UPPER_BOUND(stamps, 1) THEN
	RETURN;
END_IF

StampAtDepth := stamps[depth];
