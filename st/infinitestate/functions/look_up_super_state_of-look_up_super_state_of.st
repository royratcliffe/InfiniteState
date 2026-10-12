(* --- Interface --- *)
FUNCTION look_up_super_state_of : STATE
VAR_INPUT
	hierarchy : ARRAY[*] OF Tuple; (* Array of state tuples representing the infinite state hierarchy *)
	state     : STATE;             (* Sub-state for which the super-state is to be looked up *)
END_VAR
VAR
	depth : DEPTH; (* Loop index for iterating through topology tuples *)
END_VAR

(* --- Implementation --- *)
look_up_super_state_of := 0;

FOR depth := LOWER_BOUND(hierarchy, 1) TO UPPER_BOUND(hierarchy, 1) DO
	IF hierarchy[depth].subState = state THEN
		look_up_super_state_of := hierarchy[depth].superState;
		EXIT;
	END_IF
END_FOR
