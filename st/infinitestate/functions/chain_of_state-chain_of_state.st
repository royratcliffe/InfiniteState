(* --- Interface --- *)
FUNCTION chain_of_state : BOOL
VAR_INPUT
	state     : STATE;
	hierarchy : ARRAY[*] OF Tuple;
END_VAR
VAR_IN_OUT
	chain : Chain;
END_VAR
VAR
	reverse_chain : Chain;
	super_state   : STATE;
END_VAR

(* --- Implementation --- *)
chain_of_state := FALSE;

super_state := state;

WHILE super_state <> 0 DO
	IF NOT push_state_to_chain(super_state, reverse_chain) THEN
		RETURN;
	END_IF

	super_state := look_up_super_state_of(hierarchy, super_state);
END_WHILE

WHILE pop_state_from_chain(super_state, chain) DO
	;
END_WHILE;

(* Transfer states from the reverse chain back to the original chain. *)
WHILE pop_state_from_chain(super_state, reverse_chain) DO
	IF NOT push_state_to_chain(super_state, chain) THEN
		RETURN;
	END_IF
END_WHILE

chain_of_state := TRUE;
