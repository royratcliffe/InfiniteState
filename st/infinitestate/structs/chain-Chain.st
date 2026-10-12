(* --- Interface --- *)
TYPE Chain : STRUCT
		states : ARRAY[0..MAX_DEPTH] OF STATE;
		depth : DEPTH;
	END_STRUCT
END_TYPE
