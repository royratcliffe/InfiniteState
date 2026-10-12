(* --- Interface --- *)
FUNCTION look_up_sub_state_of : STATE
VAR_INPUT
	topology_tuples: ARRAY[*] OF TopologyTuple;
	super_state: STATE;
END_VAR
VAR
	depth: DEPTH;
END_VAR

(* --- Implementation --- *)
look_up_sub_state_of := STATE.empty;
FOR depth := LOWER_BOUND(topology_tuples, 1) TO UPPER_BOUND(topology_tuples, 1) DO
	IF topology_tuples[depth].superState = super_state THEN
		look_up_sub_state_of := topology_tuples[depth].subState;
		EXIT;
	END_IF
END_FOR
