(* --- Interface --- *)
FUNCTION lca : DEPTH
VAR_IN_OUT CONSTANT
	outgoing: Chain;
	incoming: Chain;
END_VAR
VAR
	depth: DEPTH := 0;
END_VAR

(* --- Implementation --- *)
WHILE depth < incoming.depth DO
	IF depth = outgoing.depth THEN
		EXIT;
	END_IF

	IF LOWER_BOUND(outgoing.states, 1) > depth OR depth > UPPER_BOUND(outgoing.states, 1) THEN
		EXIT;
	END_IF

	IF outgoing.states[depth] <> incoming.states[depth] THEN
		EXIT;
	END_IF

	depth := depth + 1;
END_WHILE

lca := depth;
