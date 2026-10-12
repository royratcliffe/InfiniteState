(* --- Interface --- *)
FUNCTION find_depth_in_chain : DEPTH
VAR_INPUT
	state : STATE; (* The state whose depth in the chain is to be found *)
END_VAR
VAR_IN_OUT CONSTANT
	chain : Chain; (* The chain in which to find the depth of the given state *)
END_VAR
VAR
	depth : DEPTH; (* The current depth being checked in the chain *)
END_VAR

(* --- Implementation --- *)
find_depth_in_chain := NOT_DEPTH;

FOR depth := LOWER_BOUND(chain.states, 1) TO UPPER_BOUND(chain.states, 1) DO
	(* The FOR loop iterates through the states in the chain,
	   inclusively from the lower bound to the upper bound, to find the
	   depth of the given state. Fail when the scan depth matches or
	   exceeds the chain depth. In practice, it will never exceed the
	   chain depth. *)
	IF depth >= chain.depth THEN
		EXIT;
	END_IF

	IF chain.states[depth] = state THEN
		find_depth_in_chain := depth;
		EXIT;
	END_IF
END_FOR
