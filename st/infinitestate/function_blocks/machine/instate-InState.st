(* --- Interface --- *)
METHOD InState : BOOL
VAR_INPUT
	state : STATE;
END_VAR

(* --- Implementation --- *)
InState := find_depth_in_chain(state, chain) <> ERROR_DEPTH;
