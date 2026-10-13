(* --- Interface --- *)
FUNCTION pop_state_from_chain : BOOL
VAR_IN_OUT
	state : STATE; (* The state popped from the chain, if successful *)
	chain : Chain; (* The chain from which to pop the state *)
END_VAR
VAR
	depth : DEPTH; (* The depth of the chain after pre-decrementing *)
END_VAR

(* --- Implementation --- *)
pop_state_from_chain := FALSE;
depth                := chain.depth - 1; (* pre-decrement the depth of the chain *)

(* Answer FALSE if the pre-decremented depth is out of bounds, TRUE
   otherwise. Zero out the popped state in the chain. Not strictly
   necessary, but helps prevent stale states. *)
IF LOWER_BOUND(chain.states, 1) > depth OR depth > UPPER_BOUND(chain.states, 1) THEN
	RETURN;
END_IF

chain.depth          := depth;
state                := chain.states[depth];
chain.states[depth]  := 0;
pop_state_from_chain := TRUE;
