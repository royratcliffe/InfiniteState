(* --- Interface --- *)
METHOD AtDepth : STATE
VAR_INPUT
	depth : DEPTH;
END_VAR

(* --- Implementation --- *)
AtDepth := 0;

IF LOWER_BOUND(chain.states, 1) > depth OR depth > UPPER_BOUND(chain.states, 1) THEN
	RETURN;
END_IF

IF depth > chain.depth THEN
	RETURN;
END_IF

AtDepth := chain.states[depth];
