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
