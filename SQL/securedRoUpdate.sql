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

CREATE OR REPLACE FUNCTION securedRODataUpdate(user_id VARCHAR, ro_id VARCHAR, val jsonb)
RETURNS INT AS $$

DECLARE 

	cur_priority INT;

BEGIN

	cur_priority = getUpdatePriority(user_id , ro_id ) ;


	IF check_update_priority(user_id , ro_id) = TRUE THEN 
			EXECUTE format('UPDATE RealmObject SET data_core=%1$L WHERE ro_id=%2$L', val,ro_id  );
	END IF;


	
	
	RETURN cur_priority;
	
END; $$
LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION securedROSGUpdate(user_id VARCHAR, ro_id VARCHAR, val text[])
RETURNS INT AS $$

DECLARE 

	cur_priority INT;

BEGIN

	cur_priority = getUpdatePriority(user_id , ro_id ) ;


	IF check_update_priority(user_id , ro_id) = TRUE THEN 
			EXECUTE format('UPDATE RealmObject SET security_groups=%1$L WHERE ro_id=%2$L', val,ro_id  );
	END IF;


	
	
	RETURN cur_priority;
	
END; $$
LANGUAGE 'plpgsql';