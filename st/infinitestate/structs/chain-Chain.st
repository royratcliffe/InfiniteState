(* --- Interface --- *)
TYPE Chain : STRUCT
		states : ARRAY[LOWER_DEPTH..UPPER_DEPTH] OF STATE;
		depth  : DEPTH;
	END_STRUCT
END_TYPE
