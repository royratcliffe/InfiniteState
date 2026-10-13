(* --- Interface --- *)
METHOD PROTECTED ExitState : BOOL
VAR_INPUT
	depth : DEPTH;
END_VAR

(* --- Implementation --- *)
ExitState := FALSE;

IF LOWER_BOUND(stamps, 1) > depth OR depth > UPPER_BOUND(stamps, 1) THEN
	RETURN;
END_IF

stamps[depth] := EMPTY_STAMP;
ExitState     := TRUE;
