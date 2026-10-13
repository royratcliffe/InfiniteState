(* --- Interface --- *)
METHOD StampAtDepth : SysTimeRtc.SYSTIME
VAR_INPUT
	depth : DEPTH;
END_VAR

(* --- Implementation --- *)
StampAtDepth := ULINT#0;

IF depth = ERROR_DEPTH THEN
	RETURN;
END_IF

IF LOWER_BOUND(stamps, 1) > depth OR depth > UPPER_BOUND(stamps, 1) THEN
	RETURN;
END_IF

StampAtDepth := stamps[depth];
