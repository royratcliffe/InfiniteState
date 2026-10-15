(* =============================================================================
Function Block : Machine

Purpose:
    Tracks a hierarchical machine's active state path and records the time each
    active state was entered.

Application:
    Use one instance per machine. Supply the state hierarchy when requesting a
    transition, then inspect the active, entered, and exited states and state
    timestamps through the instance.

Operation:
    1. Call GoTo with a target state and its hierarchy of (superState, subState)
       pairs.
    2. GoTo finds the common ancestor, removes states no longer active, and
       adds the target's remaining ancestors and state to the active path.
    3. Entered states receive a high-resolution RTC timestamp. The EntryStates
       and ExitStates outputs report the states added to and removed from the
       path by the most recent transition.

Inputs:
    GoTo.state      - Target state to activate.
    GoTo.hierarchy  - Array of Tuple values describing super-state/sub-state
                      relationships; EMPTY_STATE terminates the target path.

Outputs:
    Depth       - Number of active states in the path.
    States      - Active state path, ordered from outermost to innermost.
    EntryDepth  - Number of states entered by the most recent GoTo.
    EntryStates - States entered, ordered from outermost to innermost.
    ExitDepth   - Number of states exited by the most recent GoTo.
    ExitStates  - States exited, ordered from innermost to outermost.

InOut:
    GoTo.hierarchy  - Caller-provided hierarchy array, passed as constant
                      in-out data to the GoTo method.

Alarms/Faults:
    No alarm outputs. GoTo returns FALSE when it cannot build or complete a
    transition. Timestamp methods return EMPTY_STAMP if a timestamp is
    unavailable or the RTC call fails.

Assumptions:
    - State identifiers are nonzero; EMPTY_STATE (0) denotes no state and ends
      the ancestry walk.
    - The hierarchy contains the parent relationship needed to reach the
      requested target, and the system high-resolution RTC is available.

Limitations:
    - The active path and transition lists have fixed bounds LOWER_DEPTH..UPPER_DEPTH
      (currently 0..7), for a maximum of eight states.
    - GoTo processes a transition incrementally; if it returns FALSE after
      processing has begun, inspect the outputs before issuing another
      transition.

Dependencies:
    - Chain, Tuple, STATE, DEPTH, and STAMP declarations and the state-chain
      helper functions.
    - SysTimeRtc and CmpErrors libraries for high-resolution timestamps.

Example:

    xTransitioned := fbMachine.GoTo(
        state := targetState,
        hierarchy := stateHierarchy
    );

Revision History:
    See source control history.
============================================================================= *)
(* --- Interface --- *)
FUNCTION_BLOCK Machine
VAR
	chain      : Chain;
	entryChain : Chain;
	exitChain  : Chain;
	stamps     : ARRAY[LOWER_DEPTH..UPPER_DEPTH] OF STAMP;
END_VAR
VAR_OUTPUT
	Depth       : DEPTH;
	States      : ARRAY[LOWER_DEPTH..UPPER_DEPTH] OF STATE;
	EntryDepth  : DEPTH;
	EntryStates : ARRAY[LOWER_DEPTH..UPPER_DEPTH] OF STATE;
	ExitDepth   : DEPTH;
	ExitStates  : ARRAY[LOWER_DEPTH..UPPER_DEPTH] OF STATE;
END_VAR

(* --- Implementation --- *)
Depth       := chain.depth;
States      := chain.states;
EntryDepth  := entryChain.depth;
EntryStates := entryChain.states;
ExitDepth   := exitChain.depth;
ExitStates  := exitChain.states;
