(* --- Interface --- *)
{attribute 'conditionalshow'}
{attribute 'conditionalshow' := 'DevMode'}
{attribute 'hide'}
{attribute 'analysis' := '-43'}
VAR_GLOBAL CONSTANT
END_VAR
VAR_GLOBAL CONSTANT
	LOWER_DEPTH : DEPTH := 0;
	UPPER_DEPTH : DEPTH := 7;
	ERROR_DEPTH : DEPTH := -1;
	EMPTY_STATE : STATE := 0;
	EMPTY_STAMP : STAMP := ULINT#0;
END_VAR
VAR_GLOBAL
	now : STAMP := EMPTY_STAMP;
END_VAR
