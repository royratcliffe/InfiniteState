(* --- Interface --- *)
FUNCTION push_state_to_chain : BOOL
VAR_INPUT
	state : STATE;
END_VAR
VAR_IN_OUT
	chain : Chain;
END_VAR

(* --- Implementation --- *)
push_state_to_chain := FALSE;

IF state = EMPTY_STATE THEN
	RETURN;
END_IF

IF LOWER_BOUND(chain.states, 1) > chain.depth OR chain.depth > UPPER_BOUND(chain.states, 1) THEN
	RETURN;
END_IF

chain.states[chain.depth] := state;
chain.depth               := chain.depth + 1;
push_state_to_chain       := TRUE;
