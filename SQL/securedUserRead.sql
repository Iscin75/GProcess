CREATE OR REPLACE FUNCTION securedUserRead(user_id VARCHAR, dest_user_id VARCHAR) 
RETURNS TABLE(
    r_u_id CHAR(100),
    r_login CHAR(150),
	r_password CHAR(50),
	r_logged bool
	

) AS $$


DECLARE 

	cur_priority INT;

BEGIN

	
	cur_priority = getReadPriority(user_id , dest_user_id) ;
	
	CASE cur_priority
		WHEN 1 OR 3 THEN
	
			RETURN QUERY SELECT *
			FROM
			Users
			WHERE
			u_id = dest_user_id;
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

