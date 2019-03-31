CREATE OR REPLACE FUNCTION securedUserCredentialsUpdate(user_id VARCHAR, dest_user_id VARCHAR, colName VARCHAR, val VARCHAR)
RETURNS INT AS $$

DECLARE 

	cur_priority INT;

BEGIN

	cur_priority = getUpdatePriority(user_id , dest_user_id ) ;


	IF check_update_priority(user_id , dest_user_id) = TRUE THEN 
			EXECUTE format('UPDATE users SET %1$I=%2$L WHERE u_id=%3$L',colname, val,dest_user_id  );
	END IF;


	
	
	RETURN cur_priority;
	
END; $$
LANGUAGE 'plpgsql';
