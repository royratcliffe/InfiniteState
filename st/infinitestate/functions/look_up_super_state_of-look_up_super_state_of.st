(* --- Interface --- *)
FUNCTION look_up_super_state_of : STATE
VAR_INPUT
	state_tuples: ARRAY[*] OF StateTuple; (* Array of state tuples representing the infinite state hierarchy *)
	sub_state: STATE; (* Sub-state for which the super-state is to be looked up *)
END_VAR
VAR
	depth: DEPTH; (* Loop index for iterating through topology tuples *)
END_VAR

(* --- Implementation --- *)
look_up_super_state_of := STATE.empty;
FOR depth := LOWER_BOUND(state_tuples, 1) TO UPPER_BOUND(state_tuples, 1) DO
	IF state_tuples[depth].subState = sub_state THEN
		look_up_super_state_of := state_tuples[depth].superState;
		EXIT;
	END_IF
END_FOR
