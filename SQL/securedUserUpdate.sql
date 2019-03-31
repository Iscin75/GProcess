CREATE OR REPLACE FUNCTION securedUserCredentialsUpdate(user_id VARCHAR, dest_user_id VARCHAR, colName VARCHAR, val VARCHAR)
RETURNS INT AS $$

DECLARE 

	cur_priority INT;

BEGIN

cur_priority = getUpdatePriority(user_id , dest_user_id ) ;

	CASE cur_priority
		WHEN 1 THEN
			EXECUTE format('UPDATE users SET %1$I=%2$L WHERE u_id=%3$L',colname, val,dest_user_id  );
			
			 /*UPDATE securityGroup SET colname = autorization WHERE sg_id = psg_id;*/
		WHEN 2 THEN
			RAISE EXCEPTION 'Forbidden';
		WHEN  3 THEN
				EXECUTE format('UPDATE users SET %1$I=%2$L WHERE u_id=%3$L',colname, val,dest_user_id  );
			
		WHEN 4 THEN
			RAISE EXCEPTION 'None';
		WHEN 5 THEN
			RAISE EXCEPTION 'Undefined';
		WHEN 6 THEN
			RAISE EXCEPTION 'Unrelated';
	
	END CASE;
	
	RETURN cur_priority;
	
END; $$
LANGUAGE 'plpgsql';
