(* --- Interface --- *)
FUNCTION pop_state_from_chain : BOOL
VAR_IN_OUT
	state: STATE;
	chain: Chain;
END_VAR
VAR
	depth: DEPTH;
END_VAR

(* --- Implementation --- *)
depth := chain.depth - 1;

IF LOWER_BOUND(chain.states, 1) <= depth AND depth <= UPPER_BOUND(chain.states, 1) THEN
	chain.depth          := depth;
	state                := chain.states[depth];
	chain.states[depth]  := 0;
	pop_state_from_chain := TRUE;
ELSE
	pop_state_from_chain := FALSE;
END_IF
