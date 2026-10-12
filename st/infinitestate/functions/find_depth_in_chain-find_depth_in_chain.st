(* --- Interface --- *)
FUNCTION find_depth_in_chain : DEPTH
VAR_INPUT
	state : STATE;
END_VAR
VAR_IN_OUT CONSTANT
	chain : Chain;
END_VAR
VAR
	depth : DEPTH;
END_VAR

(* --- Implementation --- *)
find_depth_in_chain := NOT_DEPTH;

FOR depth := LOWER_BOUND(chain.states, 1) TO UPPER_BOUND(chain.states, 1) DO
	IF depth > chain.depth THEN
		EXIT;
	END_IF

	IF chain.states[depth] = state THEN
		find_depth_in_chain := depth;
		EXIT;
	END_IF
END_FOR
