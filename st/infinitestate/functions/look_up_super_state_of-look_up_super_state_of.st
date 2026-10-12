(* --- Interface --- *)
FUNCTION look_up_super_state_of : STATE
VAR_INPUT
	topology_tuples: ARRAY[*] OF TopologyTuple; (* Array of state tuples representing the infinite state hierarchy *)
	sub_state: STATE; (* Sub-state for which the super-state is to be looked up *)
END_VAR
VAR
	depth: DEPTH; (* Loop index for iterating through topology tuples *)
END_VAR

(* --- Implementation --- *)
look_up_super_state_of := STATE.empty;
FOR depth := LOWER_BOUND(topology_tuples, 1) TO UPPER_BOUND(topology_tuples, 1) DO
	IF topology_tuples[depth].subState = sub_state THEN
		look_up_super_state_of := topology_tuples[depth].superState;
		EXIT;
	END_IF;
END_FOR;
