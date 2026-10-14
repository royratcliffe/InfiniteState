(* --- Interface --- *)
FUNCTION empty_chain : BOOL
VAR_IN_OUT
	chain : Chain;
END_VAR
VAR
	super_state : STATE;
END_VAR

(* --- Implementation --- *)
WHILE pop_state_from_chain(super_state, chain) DO
	;
END_WHILE;

(* Always returns TRUE, indicating the chain has been emptied, even if
   it was already empty. *)
empty_chain := TRUE;
