(* --- Interface --- *)
FUNCTION state_at_depth : STATE
VAR_INPUT
	depth : DEPTH;
END_VAR
VAR_IN_OUT CONSTANT
	chain : Chain; (* Chain in which to find the state at the given depth *)
END_VAR

(* --- Implementation --- *)
state_at_depth := EMPTY_STATE;

IF LOWER_BOUND(chain.states, 1) > depth THEN
	RETURN;
END_IF

IF depth > UPPER_BOUND(chain.states, 1) THEN
	RETURN;
END_IF

state_at_depth := chain.states[depth];
