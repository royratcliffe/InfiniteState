(* --- Interface --- *)
FUNCTION push_state_to_chain : BOOL
VAR_INPUT
	state: STATE;
END_VAR
VAR_IN_OUT
	chain: Chain;
END_VAR

(* --- Implementation --- *)
IF LOWER_BOUND(chain.states, 1) <= chain.depth AND chain.depth <= UPPER_BOUND(chain.states, 1) THEN
	chain.states[chain.depth] := state;
	chain.depth               := chain.depth + 1;
	push_state_to_chain       := TRUE;
ELSE
	push_state_to_chain := FALSE;
END_IF
