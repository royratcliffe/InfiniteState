(* --- Interface --- *)
METHOD PROTECTED EnterState : BOOL
VAR_INPUT
	depth : DEPTH;
END_VAR

(* --- Implementation --- *)
EnterState := FALSE;

IF LOWER_BOUND(stamps, 1) > depth OR depth > UPPER_BOUND(stamps, 1) THEN
	RETURN;
END_IF

IF SysTimeRtcHighResGet(stamps[depth]) <> CmpErrors.Errors.ERR_OK THEN
	RETURN;
END_IF

EnterState := TRUE;
