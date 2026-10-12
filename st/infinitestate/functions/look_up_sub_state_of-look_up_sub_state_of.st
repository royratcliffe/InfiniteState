(* --- Interface --- *)
FUNCTION look_up_sub_state_of : STATE
VAR_INPUT
	state_tuples : ARRAY[*] OF Tuple;
	super_state  : STATE;
END_VAR
VAR
	depth : DEPTH;
END_VAR

(* --- Implementation --- *)
look_up_sub_state_of := STATE.empty;

FOR depth := LOWER_BOUND(state_tuples, 1) TO UPPER_BOUND(state_tuples, 1) DO
	IF state_tuples[depth].superState = super_state THEN
		look_up_sub_state_of := state_tuples[depth].subState;
		EXIT;
	END_IF
END_FOR
