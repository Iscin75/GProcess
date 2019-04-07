CREATE OR REPLACE FUNCTION securedROUpdate(user_id VARCHAR, ro_id VARCHAR, colName VARCHAR, val VARCHAR)
RETURNS INT AS $$

DECLARE 

	cur_priority INT;

BEGIN

	cur_priority = getUpdatePriority(user_id , ro_id ) ;


	IF check_update_priority(user_id , ro_id) = TRUE THEN 
			EXECUTE format('UPDATE RealmObject SET %1$I=%2$L WHERE ro_id=%3$L',colname, val,ro_id  );
	END IF;


	
	
	RETURN cur_priority;
	
END; $$
LANGUAGE 'plpgsql';