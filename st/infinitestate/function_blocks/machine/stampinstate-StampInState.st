(* --- Interface --- *)
METHOD StampInState : SysTimeRtc.SYSTIME
VAR_INPUT
	state : STATE;
END_VAR

(* --- Implementation --- *)
StampInState := StampAtDepth(depth_in_chain(state, chain));
