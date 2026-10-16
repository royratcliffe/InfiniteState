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

stamps[depth] := now;
EnterState    := TRUE;
