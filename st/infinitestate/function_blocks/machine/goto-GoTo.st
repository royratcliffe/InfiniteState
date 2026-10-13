(* --- Interface --- *)
METHOD GoTo : BOOL
VAR_INPUT
	state: STATE;
END_VAR
VAR_IN_OUT CONSTANT
	hierarchy: ARRAY[*] OF Tuple;
END_VAR
VAR
	chain: Chain;
	depth: DEPTH := 0;
	sub_state: STATE;
END_VAR

(* --- Implementation --- *)
GoTo := FALSE;

IF NOT chain_of_state(state, hierarchy, chain) THEN
	RETURN;
END_IF

{analysis -62}
WHILE depth < chain.depth DO
	IF depth = THIS^.chain.depth THEN
		EXIT;
	END_IF

	IF THIS^.chain.states[depth] <> chain.states[depth] THEN
		EXIT;
	END_IF

	depth := depth + 1;
END_WHILE
{analysis +62}

{analysis -41}
WHILE THIS^.chain.depth > depth DO
	IF NOT pop_state_from_chain(sub_state, THIS^.chain) THEN
		RETURN;
	END_IF
END_WHILE

WHILE THIS^.chain.depth < chain.depth DO
	IF NOT push_state_to_chain(chain.states[depth], THIS^.chain) THEN
		RETURN;
	END_IF
END_WHILE
{analysis +41}

GoTo := TRUE;
