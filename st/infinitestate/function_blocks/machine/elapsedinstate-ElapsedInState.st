(* --- Interface --- *)
METHOD ElapsedInState : SysTimeRtc.SYSTIME
VAR_INPUT
	state : STATE;
END_VAR
VAR
	now   : SysTimeRtc.SYSTIME;
	stamp : SysTimeRtc.SYSTIME;
END_VAR

(* --- Implementation --- *)
ElapsedInState := ULINT#0;

IF SysTimeRtcHighResGet(now) <> CmpErrors.Errors.ERR_OK THEN
	RETURN;
END_IF

stamp := StampInState(state);

IF stamp = ULINT#0 THEN
	RETURN;
END_IF

ElapsedInState := now - stamp;
