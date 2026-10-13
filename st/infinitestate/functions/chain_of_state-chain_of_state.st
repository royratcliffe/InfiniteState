(* --- Interface --- *)
FUNCTION chain_of_state : BOOL
VAR_INPUT
	state : STATE;
END_VAR
VAR_IN_OUT CONSTANT
	hierarchy : ARRAY[*] OF Tuple;
END_VAR
VAR_IN_OUT
	chain : Chain;
END_VAR
VAR
	super_chain : Chain;
	super_state : STATE;
END_VAR

(* --- Implementation --- *)
chain_of_state := FALSE;
super_state    := state;

WHILE super_state <> 0 DO
	IF NOT push_state_to_chain(super_state, super_chain) THEN
		RETURN;
	END_IF

	super_state := look_up_super_state_of(super_state, hierarchy);
END_WHILE

(* Pop all states from the original chain. This empties the original
   chain before transferring states from the reverse chain. As a
   by-product, the original chain will be empty and cleared before
   states are transferred from the reverse chain. *)
WHILE pop_state_from_chain(super_state, chain) DO
	;
END_WHILE;

(* Transfer states from the reverse chain back to the original chain.
   This will never fail in practice. The reverse chain fits, so the
   transfer back to the original chain will always succeed. The push
   check exists for completeness. *)
WHILE pop_state_from_chain(super_state, super_chain) DO
	IF NOT push_state_to_chain(super_state, chain) THEN
		RETURN;
	END_IF
END_WHILE

chain_of_state := TRUE;
