(* --- Interface --- *)
(*
===============================================================================
Function : super_state_of

Purpose:
    Returns the super-state associated with a state in the hierarchy.

Application:
    Look up the parent state while traversing a state hierarchy.

Inputs:
    state       - State whose super-state is to be found.
    hierarchy   - Array of super-state/sub-state tuples to search.

Return Value:
    STATE       - The super-state from the first matching tuple, or
                  EMPTY_STATE when no tuple matches.

Assumptions:
    - Each tuple associates a sub-state with its super-state.
    - A sub-state occurs at most once in the hierarchy.

Limitations:
    - EMPTY_STATE represents both a top-level state and a state not found.
    - The lookup is linear in the number of hierarchy tuples.

Example:

    super_state := super_state_of(
        state := sub_state,
        hierarchy := hierarchy
    );
===============================================================================
*)
FUNCTION super_state_of : STATE
VAR_INPUT
	state : STATE; (* Sub-state for which the super-state is to be looked up *)
END_VAR
VAR_IN_OUT CONSTANT
	hierarchy : ARRAY[*] OF Tuple; (* Array of state tuples representing the infinite state hierarchy *)
END_VAR
VAR
	depth : DEPTH; (* Loop index for iterating through topology tuples *)
END_VAR

(* --- Implementation --- *)
super_state_of := EMPTY_STATE;

(* Walk the hierarchy to find the super-state of the given sub-state.
   Fail if not found by leaving the result as EMPTY_STATE. State's with
   no super-state amount to top-level states and implicitly have
   EMPTY_STATE as their super-state. Beneath every such state lies a
   void of emptiness where infinite possibilities unfold! *)
FOR depth := LOWER_BOUND(hierarchy, 1) TO UPPER_BOUND(hierarchy, 1) DO
	IF hierarchy[depth].subState = state THEN
		super_state_of := hierarchy[depth].superState;
		EXIT;
	END_IF
END_FOR
