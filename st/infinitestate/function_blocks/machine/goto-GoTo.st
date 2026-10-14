(* --- Interface --- *)
METHOD GoTo : BOOL
VAR_INPUT
	state : STATE;
END_VAR
VAR_IN_OUT CONSTANT
	hierarchy : ARRAY[*] OF Tuple;
END_VAR
VAR
	chain     : Chain;
	depth     : DEPTH;
	sub_state : STATE;
END_VAR

(* --- Implementation --- *)
GoTo := FALSE;

(* Build the chain of states leading to the target jump state based on the given hierarchy. *)
IF NOT chain_of_state(state, hierarchy, chain) THEN
	RETURN;
END_IF

(* Determine the depth of the least-common ancestor between the current chain and the jump chain. *)
depth := lca(THIS^.chain, chain);

{analysis -41}
WHILE THIS^.chain.depth > depth DO
	IF NOT ExitState(THIS^.chain.depth - 1) THEN
		RETURN;
	END_IF

	IF NOT pop_state_from_chain(sub_state, THIS^.chain) THEN
		RETURN;
	END_IF
END_WHILE

WHILE THIS^.chain.depth < chain.depth DO
	IF NOT push_state_to_chain(state_at_depth(THIS^.chain.depth, chain), THIS^.chain) THEN
		RETURN;
	END_IF

	IF NOT EnterState(THIS^.chain.depth - 1) THEN
		RETURN;
	END_IF
END_WHILE

{analysis +41}
GoTo := TRUE;
