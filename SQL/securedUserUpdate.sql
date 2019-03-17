CREATE OR REPLACE FUNCTION securedUserCredentialsUpdate(user_id VARCHAR, dest_user_id VARCHAR, colName VARCHAR, val VARCHAR)
RETURNS VOID AS $$

DECLARE 

	cur_priority INT;

BEGIN

cur_priority = getUpdatePriority(user_id , dest_user_id ) ;

CASE cur_priority
		WHEN 1 OR 3 THEN
	
			UPDATE Users SET colName = val WHERE u_id = dest_user_id;
		WHEN 2 THEN
			RAISE EXCEPTION 'Forbidden';
		WHEN 4 THEN
			RAISE EXCEPTION 'None';
		WHEN 5 THEN
			RAISE EXCEPTION 'Undefined';
		WHEN 6 THEN
			RAISE EXCEPTION 'Unrelated';
	
	END CASE;
	
	
END; $$
LANGUAGE 'plpgsql';

