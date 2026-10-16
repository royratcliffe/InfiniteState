(* --- Interface --- *)
METHOD ElapsedInState : STAMP
VAR_INPUT
	state : STATE;
END_VAR
VAR
	stamp : STAMP;
END_VAR

(* --- Implementation --- *)
ElapsedInState := EMPTY_STAMP;
stamp          := StampInState(state);

IF stamp = EMPTY_STAMP THEN
	RETURN;
END_IF

ElapsedInState := now - stamp;
