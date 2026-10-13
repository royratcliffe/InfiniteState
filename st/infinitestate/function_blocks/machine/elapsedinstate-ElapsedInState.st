(* --- Interface --- *)
METHOD ElapsedInState : STAMP
VAR_INPUT
	state : STATE;
END_VAR
VAR
	now   : STAMP;
	stamp : STAMP;
END_VAR

(* --- Implementation --- *)
ElapsedInState := EMPTY_STAMP;

IF SysTimeRtcHighResGet(now) <> CmpErrors.Errors.ERR_OK THEN
	RETURN;
END_IF

stamp := StampInState(state);

IF stamp = EMPTY_STAMP THEN
	RETURN;
END_IF

ElapsedInState := now - stamp;
